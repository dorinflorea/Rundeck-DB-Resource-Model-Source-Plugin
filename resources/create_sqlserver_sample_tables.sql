

CREATE TABLE DATABASES_RUNDECK_COLUMNS
(
  COLUMN_NAME  VARCHAR(400),
  COLUMN_ROLE  VARCHAR(400)
);


Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('PROD_TEST', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('THREAD', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('DATABASE_ROLE', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('DB_UNIQUE_NAME', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('CLUSTER_TYPE', 'TAG');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('OS_USER', 'ATTRIBUTE USERNAME');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('VERSION', 'TAG ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('ORACLE_HOME', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('SID', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('LAST_SEEN', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('HOST_NAME', 'ATTRIBUTE HOST_NAME NODE_NAME');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('IS_UP', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('SAVE_BIN_DIR', 'ATTRIBUTE');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('VIRTUAL', 'TAG');
Insert into DATABASES_RUNDECK_COLUMNS (COLUMN_NAME, COLUMN_ROLE)  Values ('TIP_OS', 'TAG');



CREATE TABLE DATABASES_DATA
(
  PROD_TEST       VARCHAR(4),
  THREAD          VARCHAR(10),
  DATABASE_ROLE   VARCHAR(100),
  DB_UNIQUE_NAME  VARCHAR(100),
  CLUSTER_TYPE    VARCHAR(4000),
  OS_USER         VARCHAR(100),
  VERSION         VARCHAR(400),
  ORACLE_HOME     VARCHAR(400),
  SID             VARCHAR(100),
  LAST_SEEN       DATE,
  HOST_NAME       VARCHAR(400),
  IS_UP           INT,
  SAVE_BIN_DIR    VARCHAR(1600),
  VIRTUAL         VARCHAR(1000),
  TIP_OS          VARCHAR(400)
);


Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '0', 'PHYSICAL_STANDBY', 'dbhr', 'veritas','ora_dbhr', '19.0.0.0.0', '/oradbhr/oracle/server/19c', 'dbhr', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host11', 0, '/oradbhr/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '0', 'PHYSICAL_STANDBY', 'dbhr', 'veritas','ora_dbhr', '19.0.0.0.0', '/oradbhr/oracle/server/19c', 'dbhr', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host12', 0, '/oradbhr/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '0', 'PHYSICAL_STANDBY', 'dbhr', 'veritas','ora_dbhr', '19.0.0.0.0', '/oradbhr/oracle/server/19c', 'dbhr', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host13', 1, '/oradbhr/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '0', 'PHYSICAL_STANDBY', 'dbhr', 'veritas','ora_dbhr', '19.0.0.0.0', '/oradbhr/oracle/server/19c', 'dbhr', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host14', 0, '/oradbhr/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '0', 'PHYSICAL_STANDBY', 'dbhr', 'veritas','ora_dbhr', '19.0.0.0.0', '/oradbhr/oracle/server/19c', 'dbhr', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host15', 0, '/oradbhr/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '2', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales2', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host01.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '3', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales3', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host01.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '4', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales4', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host01.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '5', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales5', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host01.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '1', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales1', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host01.prod.orange.intra', 1, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '1', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales1', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host02.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '3', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales3', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host02.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '4', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales4', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host02.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '5', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales5', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host02.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '2', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales2', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host02.prod.orange.intra', 1, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '1', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales1', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host03.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '2', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales2', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host03.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '4', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales4', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host03.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '5', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales5', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host03.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '3', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales3', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host03.prod.orange.intra', 1, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '1', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales1', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host04.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '2', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales2', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host04.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '3', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales3', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host04.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '5', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales5', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host04.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '4', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales4', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host04.prod.orange.intra', 1, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '1', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales1', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host05.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '2', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales2', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host05.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '3', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales3', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host05.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '4', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales4', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host05.prod.orange.intra', 0, '/oradbsales/oracle', 'no_vmware', 'Linux');
Insert into DATABASES_DATA(PROD_TEST, THREAD, DATABASE_ROLE, DB_UNIQUE_NAME, CLUSTER_TYPE,OS_USER, VERSION, ORACLE_HOME, SID, LAST_SEEN,HOST_NAME, IS_UP, SAVE_BIN_DIR, VIRTUAL, TIP_OS) Values('PROD', '5', 'PRIMARY', 'dbsalescj', 'asm','ora_dbsales', '12.2.0.1.0', '/oradbsales/oracle/server/12cR2', 'dbsales5', CONVERT(DATETIME,'11/26/2021 12:31:52 PM'),'host05.prod.orange.intra', 1, '/oradbsales/oracle', 'no_vmware', 'Linux');
