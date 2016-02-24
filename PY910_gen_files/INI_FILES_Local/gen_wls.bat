@echo off

:The following line is configured by the installation process.
:It is the base directory of the current OneWorld installation.

set OW_DIR_BASE=D:\E910

:Example of an installed line:
:set OW_DIR_BASE=C:\B9

:The primary directories are the OW Web and the java executable (for JDK 1.5)
set BASE_OW_WEB_DIR=%OW_DIR_BASE%\system\oc4j

:Replace the value below with the location of your JRockit Real Time installation.
:The value should point to the \bin\java.exe file.
:Maintain quotes if a space exists between directory or file names.

:set JAVA_PGM="C:\Program Files\Java\jrockit-R27.6.5-jre1.6.0_14\bin\java.exe"

set JAVA_PGM=D:\E910\jdk\bin\java.exe

:Verify the existence of the java program.
if exist %JAVA_PGM% goto start

echo No java executable found at : %JAVA_PGM%
goto error

:start

:(1) The directory containing the genApp.ini, jas.ini, jdbj.ini, jdelog.properties & tnsnames.ora in H4A.
:set INI_DIR=%BASE_OW_WEB_DIR%\j2ee\home\applications\webclient.ear\webclient\WEB-INF\classes
set INI_DIR=D:\jasgenerator\PY910\INI_FILES_Local
:(2) The base directory of the Oracle Application Server library.(for servlet.jar)
set J2EE_HOME_LIB=%BASE_OW_WEB_DIR%\j2ee\home\lib

:(3) The base directory of the Oracle JDBC driver -- ojdbc14.jar
set O_JDBC_LIB=%BASE_OW_WEB_DIR%\jdbc\lib

:(4) The base directory for all OW E1 jar (related subfolder of gen_oas.bat)
set OW_LIB=WEB-INF\lib

:(5) The directory for the JDBC drivers and broker .jars
set O_JDBC_DIR=%OW_DIR_BASE%\MISC

:Build the classpath to the required files/jars.

:Begin with the directory of the property/ini files
set GEN_CLASSPATH=%INI_DIR%

:Add the subset of application server jars (using full path).
set GEN_CLASSPATH=%GEN_CLASSPATH%;%J2EE_HOME_LIB%\servlet.jar

:Add the subset of jars from the WebClient_WAR (using relative path).
:!!!!Note: If you add a new Jar file into the list, you need to change the equivalent list in gen.bat file.
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\avalon-framework-cvs-20020806.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Base_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\ApplicationAPIs_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\ApplicationLogic_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\BizLogicContainer_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\BizLogicContainerClient_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\BusinessLogicServices_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\BIPProxy_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\castor.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\commons-lang-2.6.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\httpclient.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\httpcore.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\httpmime.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\commons-logging.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\EventProcessor_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\E1BrokerConnector_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\E1BrokerUtil_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\E1GraphAPI_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\fop.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Generator_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\images.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\JdbjBase_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\JdbjInterfaces_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\JdeNet_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\jdewebgui.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\jmxremote-optional.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\jmxri.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Maf_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Maf2Base_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Maf2Interfaces_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\ManagementAgent_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Metadata.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\MetadataInterface.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\OMWBase_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\OWResource.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\PMApi_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\rtf2fo.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\Spec_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\System_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\SystemInterfaces_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\WebClient_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\webgui.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\WebLogin_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\WebShare_JAR.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\xalan.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\xerces.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%OW_LIB%\xmlparserv2.jar


:Add the database drivers (using full path).
:AS400 		jt400.jar, jt40016.jar which is our naming convention
:Oracle		ojdbc6.jar, standard Oracle Database JDBC Driver for JDK 1.6, ojdbc5.jar for backward compatability
:UDB		db2jcc4.jar, standard DB2 UDB Type-4 JDBC Driver for JDK 1.6, db2java.zip for Legacy Type-2 connectivity
:SQLServer200x  sqljdbc4.jar, newest version of sqljdbc.jar cannot be used with JDK 1.6, sqljdbc.jar for backward compatability
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\ojdbc6.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\ojdbc5.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\db2jcc4.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\db2java.zip
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\jt400.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\jt40016.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\sqljdbc4.jar
set GEN_CLASSPATH=%GEN_CLASSPATH%;%O_JDBC_DIR%\sqljdbc.jar

echo Starting Generator with :
%JAVA_PGM% -version

:For non-SSL connection
%JAVA_PGM% -Xss1m -Xms128m -Xmx512m -Ddefault_path=%INI_DIR% -classpath %GEN_CLASSPATH% com.jdedwards.runtime.generator.Generator %1

:For SSL connection, you need to provide a valid keystore name and location
:%JAVA_PGM% -Xss1m -Xms128m -Xmx512m -Djavax.net.ssl.trustStore=Z:/E910/e1keystore -Ddefault_path=%INI_DIR% -classpath :%GEN_CLASSPATH% com.jdedwards.runtime.generator.Generator %1

goto check

:check
if errorlevel 1 goto error
goto end
:error
Echo Error!!!
pause
:end
goto :eof

