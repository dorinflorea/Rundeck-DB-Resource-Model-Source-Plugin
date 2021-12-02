rmdir /S /Q dist
mkdir dist
jar -cvfm  dist/DBResourceModelSource.jar resources/META-INF/MANIFEST.MF -C build com
rem jar -uvf dist/DBResourceModelSource.jar lib/oracle.jar 
rem jar -uvf dist/DBResourceModelSource.jar lib/sqlserver.jar 
jar -uvf dist/DBResourceModelSource.jar lib/postgresql.jar