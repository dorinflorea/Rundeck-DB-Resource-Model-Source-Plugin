/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rundeck.plugins.oro;

/**
 *
 * @author root
 */


import com.dtolabs.rundeck.core.common.INodeSet;
import com.dtolabs.rundeck.core.common.NodeEntryImpl;
import com.dtolabs.rundeck.core.common.NodeSetImpl;
import com.dtolabs.rundeck.core.resources.ResourceModelSource;
import com.dtolabs.rundeck.core.resources.ResourceModelSourceException;
import com.dtolabs.rundeck.core.plugins.*;

import com.dtolabs.rundeck.core.plugins.configuration.PropertyScope;
import com.dtolabs.rundeck.plugins.descriptions.PluginDescription;
import com.dtolabs.rundeck.plugins.descriptions.PluginProperty;
import com.dtolabs.rundeck.plugins.notification.NotificationPlugin;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.*;
import java.io.DataInputStream;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class DBResourceModelSource implements ResourceModelSource {

    /**
     * @param args the command line arguments
     */
    
    
    private String username;
    private String password;
    private String constr;
    private String table_columns;
    private String table_data;
    private String db_provider;
    private String log_level;
    
    
    public static void main(String[] args) {
        // TODO code application logic here
        DBResourceModelSource o=new DBResourceModelSource(new Properties());

    }

    public DBResourceModelSource(Properties properties) {
            username=properties.getProperty(DBResourceModelSourceFactory.USERNAME);
            password=properties.getProperty(DBResourceModelSourceFactory.PASSWORD);
            constr=properties.getProperty(DBResourceModelSourceFactory.JDBC_CONNECTION_STRING);
            table_columns=properties.getProperty(DBResourceModelSourceFactory.TABLE_COLUMNS);
            table_data=properties.getProperty(DBResourceModelSourceFactory.TABLE_DATA);
            db_provider=properties.getProperty(DBResourceModelSourceFactory.DB_PROVIDER);
            log_level=properties.getProperty(DBResourceModelSourceFactory.LOG_LEVEL);
            if(log_level.equals("DEBUG"))
            {
                System.out.println(new Timestamp(System.currentTimeMillis())+" DBResourceModelSource Start");
        
                System.out.println("log_level="+log_level);
                System.out.println("username="+username);
                System.out.println("constr="+constr);
                System.out.println("table_columns="+table_columns);
                System.out.println("table_data="+table_data);
                System.out.println("db_provider="+db_provider);
            }
            load_nodes();
    }
    
    private NodeSetImpl load_nodes()
    {
       NodeSetImpl nodes=null;
        Statement   stmt;
        Connection   conn=null;
        ResultSet rset=null;
        Map<String, String> column_roles = new HashMap<>();
        conn=getConnection(username,password,constr);
        String select_columns="select column_name,column_role from "+table_columns;
        String columns_select=null;
        String order_by=null;
        if(conn!=null)
        {
            nodes = new NodeSetImpl();
            try{
            stmt=conn.createStatement();
            rset=stmt.executeQuery(select_columns);
            while(rset.next())
            {
                
                column_roles.put(rset.getString("column_name"),rset.getString("column_role"));
                if(columns_select==null)
                {
                    columns_select=rset.getString("column_name");
                }
                else
                {
                    columns_select=columns_select+","+rset.getString("column_name")+"";
                }
                if(rset.getString("column_role").contains("HOST_NAME"))
                {
                 order_by=rset.getString("column_name");
                }
            }
            rset.close();
            Set<String> column_names=column_roles.keySet();
            if(log_level.equals("DEBUG"))
                System.out.println("select command to generate data : select "+columns_select+" from "+table_data+" order by "+order_by);
            rset=stmt.executeQuery("select "+columns_select+" from "+table_data+" order by "+order_by);
            String curent_host=null;
            NodeEntryImpl node=null;
            HashSet<String> tags = null;
            while(rset.next())
            {
                String host=rset.getString(order_by);
                if(curent_host==null || !curent_host.equals(host))
                {
                    
                    if(curent_host==null)
                    {
                        curent_host=host;
                    }
                    else
                    {
                          node.setTags(tags);
                          nodes.putNode(node);
                          if(log_level.equals("DEBUG"))
                          {
                              System.out.println("Added node "+curent_host);
                          
                            for(String atribute:node.getAttributes().keySet())
                            {
                              System.out.println("     "+atribute+" : "+node.getAttributes().get(atribute));
                              }
                            System.out.println("--------------------------------------------");
                          }
                          curent_host=host;
                         
                    }
                    node = new NodeEntryImpl();
                    tags = new HashSet<>();
                }
                
                
                for(String column:column_names)
                {
                      String value=rset.getString(column) ;
                      String role=column_roles.get(column);
                //      System.out.println(value+" : "+role);
                      if(value==null)
                          value="NULL";
                      if(role.contains("HOST_NAME"))
                      {
                          node.setHostname(value);
                          
                      }
                      if(role.contains("NODE_NAME"))
                      {
                          node.setNodename(value);
                      }
                       if(role.contains("USERNAME"))
                      {
                             node.setUsername(value);
                      }

                      if(role.contains("TAG"))
                      {
                          if(!tags.contains(value))
                          if(!value.equals("NULL"))
                          tags.add(value);
                      }
                      if(role.contains("ATTRIBUTE") )
                      {
                          String cur_val=node.getAttribute(column);
                          if(cur_val!=null)
                              cur_val+=" "+value;
                          else
                              cur_val=value;
                          node.setAttribute(column,cur_val);
                      }
                             if(role.contains("ATTR_SINGLE"))
                      {
                          String cur_val=node.getAttribute(column);
                          if(cur_val==null)
                          {
                              node.setAttribute(column,value);
                          }
                              
                     
                      }
                      
                }
               
           
      
            }
                node.setTags(tags);
                          nodes.putNode(node);
                    if(log_level.equals("DEBUG"))        
                    { System.out.println("Added node "+curent_host);
                       System.out.println("--------------------------------------------");
                       for(String atribute:node.getAttributes().keySet())
                       {
                         System.out.println("     "+atribute+" : "+node.getAttributes().get(atribute));
                         }
                       System.out.println("--------------------------------------------");
                    }
            }catch(Exception e1)
            {
                System.out.println("Erorr get nodes from db ");
                e1.printStackTrace();
                return null;
                
            }
            }
        
           return nodes; 
    }
   
    @Override
  public INodeSet getNodes() throws ResourceModelSourceException {
        NodeSetImpl nodes=load_nodes();
          if(log_level.equals("DEBUG"))
         System.out.println("List has "+nodes.getNodeNames().size()+" nodes");
       return nodes;
    }
 
    private Connection getConnection(String username,String password,String constr) 
    {
        Connection conn=null;
         try {
             if(db_provider.equals("Oracle"))
             {
                DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
             }
             if(db_provider.equals("Postgresql"))
             {
                Class.forName("org.postgresql.Driver");     
             }
             if(db_provider.equals("Sqlserver"))
             {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");     
             }
            
            
            
            DriverManager.setLoginTimeout(100);
            java.util.Properties props_temp = new java.util.Properties();
            props_temp.put("password", password);
            props_temp.put("user", username);
        if (db_provider.equals("Oracle") && username.toLowerCase().equals("sys")) {
            props_temp.put("internal_logon", "sysdba");
            }
            
            conn = DriverManager.getConnection(constr, props_temp);
        } catch (Exception e) {
            System.out.println("Error conecting to dba ");
            e.printStackTrace();
           return null;
        }
         return conn;
    }
}
