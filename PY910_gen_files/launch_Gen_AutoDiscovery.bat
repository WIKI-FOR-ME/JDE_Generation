@echo off
echo :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: 
echo ::          Java Generator Application		    
echo ::          populate the Serialized Objects tables      
echo ::          post to a package deployment			
echo ::	         Make sure JDE snapshot is set to PY910 
echo ::          For Auto Discovery of latest package please login into JPY910 
echo ::          if you login to PY920 generation process will fail 
echo :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: 
timeout /t -1
:The following line is configured by the installation process.
:It is the base directory of the current OneWorld installation.
set OW_DIR_BASE=D:\E910
set GEN_FILE_BASE=D:\jasgenerator\PY910
set INI_DIR=%GEN_FILE_BASE%\INI_FILES_AUTO
del /q %GEN_FILE_BASE%%\log\*
set BASE_OW_WEB_DIR=%OW_DIR_BASE%\system\OC4J\j2ee\home\applications\webclient.ear\webclient
echo :: rename gen_wls file and copy pre configured file to One world install location
ren %BASE_OW_WEB_DIR%\gen_wls.bat gen_wls.bat_bak
copy /Y %INI_DIR%\gen_wls.bat  %BASE_OW_WEB_DIR%\
cd /d %BASE_OW_WEB_DIR%
gen_wls.bat %1
pause