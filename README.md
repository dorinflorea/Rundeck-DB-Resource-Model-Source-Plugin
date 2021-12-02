Rundeck DB-Resource-Model-Source-Plugin
--------------------

This is a [Rundeck Node Executor plugin][1] that uses JDBC to connect to a database and genetate a list of nodes with particular attributes/tags. 

This pluging uses 2 tables/views in order to generate list of nodes. 

One metadata table/view (named DATABASES_RUNDECK_COLUMNS but can use a different name, plugin parameter table_columns will specify the final name): column_name, column_role to describe data table/view columns (named DATABASES_DATA but can use a different name, plugin parameter table_data will specify the final name).

All column_name from metadata table will be selected from source table/view. Each column_name can have one ore more column roles separated by space:HOST_NAME NODE_NAME USERNAME TAG ATTRIBUTE ATTR_SINGLE

All rows from source table will be aggregated by column with role HOST_NAME and order by this column.

If more than one line contains the same HOST_NAME then columns with column_role ATTRIBUTE will aggregate their values in a ATTRIBUTE named COLUMN_NAME separated by spaces. 
        
If column_role contains TAG, column_value will be added as TAG (if it does't exists yet). 

If column_role contains ATTR_SINGLE, an attribute named COLUMN_NAME will be created and his value will be the the value of the last line of that particular HOST_NAME. 

If column_role contains role USERNAME, node will have USERNAME value setup.  

If column_role contains role NODENAME, node will have NODENAME value setup.

As a result, you will have a list of nodes that can be filtered by specific TAGS or ATTRIBUTES. Some attributes will act as one-dimensional array with values separated by spaces. Of course you could play with more separators to obtain multi-dimensional arrays. Eg. first separated by spaces then separated by commas.

Lets imagine you want to automate some tasks on your databases. Each node can host one or more databases. You want to execute an inline script that will run a specific query on each database. For that, you need to loop on all database running on a particular host, "su" as the user runnning specific database, set up specific environment variables and execute required query. 

First setup metadata table and source data table/view (see  [resources/create_postgresql_sample_tables.sql](resources/create_postgresql_sample_tables.sql)) 

Your node will look like this (see attributes like DATABAE_ROLE, DB_UNIQ_NAME, ORACLE_HOME that acts as one-dimensioal array with values separated by spaces). ![rundeck node](resources/node_img.jpg?raw=true "Rundeck node example")

Your inline script that will be executed on each node will look like this:
```
if [ `uname -s ` = "HP-UX" -o  `uname -s ` = "AIX" ]
then
set -A ORACLE_HOMES @node.ORACLE_HOME@
set -A IS_UP @node.IS_UP@
set -A OS_USERS @node.OS_USER@
set -A SIDS @node.SID@
set -A HOST_NAMES @node.HOST_NAME@
nodename=@node.name@
fi

if [ `uname -s ` != "HP-UX" -a  `uname -s ` != "AIX" ]
then
eval "ORACLE_HOMES=(@node.ORACLE_HOME@)"
eval "IS_UP=(@node.IS_UP@)"
eval "OS_USERS=(@node.OS_USER@)"
eval "SIDS=(@node.SID@)"
eval "HOST_NAMES=(@node.HOST_NAME@)"
nodename=@node.name@
fi

nr_targets=${#SIDS[*]}


cnt=0;
while [[ $cnt -lt $nr_targets ]]
do
    if [[ ${IS_UP[$cnt]} -eq 1 ]]
    then
        echo "will process sid=${SIDS[$cnt]} os_user=${OS_USERS[$cnt]} oracle_home=${ORACLE_HOMES[$cnt]}"
        #function bellow will su to ${OS_USERS[$cnt]}  , set up ORACLE_HOME=${ORACLE_HOMES[$cnt]}, PATH=$ORACLE_HOME/bin:$PATH and execute sqlplus / as sysdba to get some info
        get_some_info ${OS_USERS[$cnt]} ${ORACLE_HOMES[$cnt]} ${SIDS[$cnt]}  
    fi    
    let cnt=$cnt+1
done

```

[1]: https://docs.rundeck.com/docs/developer/04-node-execution-plugins.html

Compatible with Rundeck 2.3.x+

Create source tables
====

Connect to the database and create source tables (or views). As a starting point you can use : 

*    [resources/create_oracle_sample_tables.sql](resources/create_oracle_sample_tables.sql)
*    [resources/create_postgresql_sample_tables.sql](resources/create_postgresql_sample_tables.sql)
*    [resources/create_sqlserver_sample_tables.sql](resources/create_sqlserver_sample_tables.sql)




Install from release
====

Download from the [releases page](https://github.com/dorinflorea/Rundeck-DB-Resource-Model-Source-Plugin/releases).

Download jdbc vendor specific jar file depending on which type of database is used to store metadata table and data table.  

Mandatory for [Oracle](https://www.oracle.com/database/technologies/appdev/jdbc-ucp-21-3-downloads.html) . You should rename the driver to oracle.jar and add it to DBResourceModelSource-x.x.x.jar in lib directory using : jar -uvf dist/DBResourceModelSource-x.x.x.jar lib/oracle.jar

Optional, only if you want to replace existing Sqlserver [driver tag/v9.4.0](https://github.com/microsoft/mssql-jdbc/releases/download/v9.4.0/mssql-jdbc-9.4.0.jre8.jar)  download from [here](https://github.com/microsoft/mssql-jdbc/releases/) then rename the driver to sqlserver.jar and add it to DBResourceModelSource-x.x.x.jar in lib directory using : jar -uvf dist/DBResourceModelSource-x.x.x.jar lib/sqlserver.jar 
   
Optional, only if you want to replace existing Postgresql [driver 9.4-1202 JDBC 42](https://jdbc.postgresql.org/download/postgresql-9.4-1202.jdbc42.jar) download from [here](https://jdbc.postgresql.org/download.html)  then rename the driver to postgresql.jar and add it to DBResourceModelSource-x.x.x.jar in lib directory using : jar -uvf dist/DBResourceModelSource-x.x.x.jar lib/postgresql.jar 


Copy the `DBResourceModelSource-x.x.x.jar` to the $RDECK_BASE/libext directory for Rundeck.

    
Build from scratch and install
====

Download [Sources](https://github.com/dorinflorea/Rundeck-DB-Resource-Model-Source-Plugin/archive/refs/heads/main.zip)

Download rundeck core library :from your rundeck install directory /var/lig/rundeck/libext or from https://www.rundeck.com/downloads and put the jar rundeck-core-x.x.x/jar in lib directory as rundeck-core.jar

Download jdbc vendor specific jar file depending on which type of database is used to store metadata table and data table. 

Only one is needed.

Download [Oracle driver](https://www.oracle.com/database/technologies/appdev/jdbc-ucp-21-3-downloads.html) then rename the driver to oracle.jar and put it in lib directory 

Or download [Sqlserver driver](https://github.com/microsoft/mssql-jdbc/releases/) then rename the driver to sqlserver.jar and put it in lib directory
   
Or download [Posgresql driver](https://jdbc.postgresql.org/download.html) then rename the driver to postgresql.jar and put it in lib directory

Execute build.bat 

Execute  dist.bat

Execute  edit resources/test.properties

Execute  test.bat

If everything is ok, copy dist/DBResourceModelSource.jar to $RDECK_BASE/libext directory


Usage
====

You can configure the Resource Model Sources for a project either via the
RunDeck GUI, under the "Admin" page, or you can modify the `project.properties`
file to configure the sources.

See: [Resource Model Source Configuration](http://rundeck.org/1.5/manual/plugins.html#resource-model-source-configuration)

The provider name is: `DBResourceModelSource`  DB Dynamic Hosts Hosts with list of objects as tags/attributes dinamically generated from db tables/views

Here are the configuration properties:

* `jdbc_connection_string`: jdbc url used to connect to database

        For Oracle jdbc\:oracle\:thin\:@//ip\:post/service_name
        
        For Postgresql jdbc:postgresql://ip:port/database_name

        For Sqlserver jdbc:sqlserver://ip:port;databaseName=database_name
* `username`: username used to connect to database
* `password` : password of username used to connect to database (will be stored as *** after you safe config file)
* `log_level`: DEBUG OR INFO
* `provider`:  Type of database. 3 possible values : Oracle| Posgresql | Sqlserver
* `table_columns` : table name configuring columns used and their roles (columns should belog to table_data)
* `table_data`: table used to build nodes and their tags/attributes

Example of project.properties (select project from Projects then Project Settings/Edit Configuration/Edit Configuration File)

        project.description=bla bla

        ...

        resources.source.1.config.jdbc_connection_string=jdbc\:oracle\:thin\:@//172.0.0.1\:1521/orcl

        resources.source.1.config.log_level=INFO

        resources.source.1.config.password=*****

        resources.source.1.config.provider=Oracle

        resources.source.1.config.table_columns=databases_rundeck_columns

        resources.source.1.config.table_data=databases_data

        resources.source.1.config.username=rundeck

        resources.source.1.type=DBResourceModelSource

        ...



FAQ
====

If node list is empty:

    * enable debugging by setting  resources.source.1.config.log_level=DEBUG

    * check /var/log/rundeck/service.log 
