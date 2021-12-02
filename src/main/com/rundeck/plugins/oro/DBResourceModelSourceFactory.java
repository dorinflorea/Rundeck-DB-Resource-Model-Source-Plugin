/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rundeck.plugins.oro;

import com.dtolabs.rundeck.core.common.Framework;
import com.dtolabs.rundeck.core.plugins.Plugin;
import com.dtolabs.rundeck.core.plugins.configuration.*;
import com.dtolabs.rundeck.core.resources.ResourceModelSource;
import com.dtolabs.rundeck.core.resources.ResourceModelSourceFactory;
import com.dtolabs.rundeck.plugins.util.DescriptionBuilder;
import com.dtolabs.rundeck.plugins.util.PropertyBuilder;
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
import java.util.*;
import com.dtolabs.rundeck.core.plugins.configuration.*;
        
/**
 *
 * @author root
 */

@Plugin(service = "ResourceModelSource" , name = "DBResourceModelSource")
@PluginDescription(title="Hosts with list of objects as tags/attributes dinamically generated from db tables/views")
public class DBResourceModelSourceFactory implements ResourceModelSourceFactory,Describable {
    
    public static final String PROVIDER_NAME = "DBResourceModelSource";
    private Framework framework;

    public static final String ENDPOINT = "endpoint";
    public static final String FILTER_PARAMS = "filter";
    public static final String MAPPING_PARAMS = "mappingParams";
    public static final String RUNNING_ONLY = "runningOnly";
    public static final String ACCESS_KEY = "accessKey";
    public static final String SECRET_KEY = "secretKey";
    public static final String ROLE_ARN = "assumeRoleArn";
    public static final String MAPPING_FILE = "mappingFile";
    public static final String REFRESH_INTERVAL = "refreshInterval";
    public static final String USE_DEFAULT_MAPPING = "useDefaultMapping";
    public static final String HTTP_PROXY_HOST = "httpProxyHost";
    public static final String HTTP_PROXY_PORT = "httpProxyPort";
    public static final String HTTP_PROXY_USER = "httpProxyUser";
    public static final String HTTP_PROXY_PASS = "httpProxyPass";

    public static final String USERNAME="username";
    public static final String PASSWORD="password";
    public static final String JDBC_CONNECTION_STRING="jdbc_connection_string";
    public static final String TABLE_COLUMNS="table_columns";
    public static final String TABLE_DATA="table_data";
    public static final String DB_PROVIDER="provider";
    public static final String LOG_LEVEL="log_level";
    
     public ResourceModelSource createResourceModelSource(final Properties properties) throws ConfigurationException {
        final DBResourceModelSource or = new DBResourceModelSource(properties);
        return or;
    }
     public Description getDescription()
     {
         return DESC;
     }
     
      final static Map<String, Object> renderingOptionsAuthentication = getRenderOpt("Credentials",false);
    final static Map<String, Object> renderingOptionsConnection = getRenderOpt("Connection",false);
    final static Map<String, Object> renderingOptionsResource = getRenderOpt("Resource",false);

    protected static Map<String, Object> getRenderOpt(String value, boolean secondary) {
        Map<String, Object> ret = new HashMap<>();
        ret.put(StringRenderingConstants.GROUP_NAME,value);
        if(secondary){
            ret.put(StringRenderingConstants.GROUPING,"secondary");
        }
        return ret;
    }
      private static List<String> database_types = new ArrayList<>(Arrays.asList
            (
                    "Oracle",
                    "Postgresql",
                    "Sqlserver"
            ));
       private static List<String> log_level_types = new ArrayList<>(Arrays.asList
            (
                    "NONE",
                    "INFO",
                    "DEBUG"
            ));
     
     
     static Description DESC = DescriptionBuilder.builder()
            .name(PROVIDER_NAME)
            .title("DB Dynamic Hosts")
            .description("Hosts with list of objects as tags/attributes dinamically generated from db tables/views")
            .property(PropertyUtil.string(USERNAME, "Database user name", "Username used to connect to database containing data for nodes.", false,
                    null,null,null, renderingOptionsAuthentication))
             .property(PropertyUtil.string(PASSWORD,"Database password","Password used to connect to database containing data for nodes.", false,
                            null,
                            null,
                            null,
                            Collections.singletonMap("displayType", (Object) StringRenderingConstants.DisplayType.PASSWORD)
                    )
            )
             .property(PropertyUtil.select(DB_PROVIDER,"Database type",
                    "Database type.",
                    true, "Oracle",database_types,null,renderingOptionsResource))
             .property(PropertyUtil.string(JDBC_CONNECTION_STRING, "JDBC URL",
                    "Connection string for jdbc driver. For Oracle jdbc:oracle:thin:@//ip:port/service_name", false,
                    null,null,null,renderingOptionsConnection))
             .property(PropertyUtil.string(TABLE_COLUMNS, "Table containing selected columns", "Table containing selected columns", true,
                    null,null,null,renderingOptionsResource))
             .property(PropertyUtil.string(TABLE_DATA, "Table or view containing data", "Table or view containing data", true,
                    null,null,null,renderingOptionsResource))
              .property(PropertyUtil.select(LOG_LEVEL,"Log level",
                    "Log level",
                    true, "NONE",log_level_types,null,renderingOptionsResource))
            .build();

}
