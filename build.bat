set JAVA_HOME=C:\Programe\oracle\product\product\19.0.0\client_1\jdk
SET PATH=%JAVA_HOME%\bin;%PATH%
rmdir /S /Q build
mkdir build
javac -classpath lib\oracle.jar;lib\rundeck-core.jar;lib\sqlserver.jar;lib\postgresql.jar -sourcepath src\main -d build  src\main\com\rundeck\plugins\oro\*.java src\test\com\rundeck\plugins\oro\*.java
