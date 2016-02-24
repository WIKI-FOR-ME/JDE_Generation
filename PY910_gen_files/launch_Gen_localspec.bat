@echo off
echo :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: 
echo ::          Java Generator Application		    
echo ::          populate the Serialized Objects tables      
echo ::          using Local spec on Gen machin			
echo ::	         Make sure JDE snapshot is set to PY910 
echo ::          Make sure latest Full/Update package is installed 
echo ::          On gen machine 
echo :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: 
timeout /t -1
:It is the base directory of the current OneWorld installation.
set OW_DIR_BASE=D:\E910
set GEN_FILE_BASE=D:\jasgenerator\PY910
set OW_pathcode_ini=%OW_DIR_BASE%\PY910\spec
set INI_DIR=%GEN_FILE_BASE%\INI_FILES_Local
del /q %GEN_FILE_BASE%%\log\*
more %OW_pathcode_ini%\spec.ini
echo Verify the spec.ini file before continueing 
timeout /t -1
set BASE_OW_WEB_DIR=%OW_DIR_BASE%\system\OC4J\j2ee\home\applications\webclient.ear\webclient
echo :: rename gen_wls file and copy pre configured file to One world install location
ren %BASE_OW_WEB_DIR%\gen_wls.bat gen_wls.bat_bak
copy /Y %INI_DIR%\gen_wls.bat  %BASE_OW_WEB_DIR%\
cd /d %BASE_OW_WEB_DIR%
gen_wls.bat %1
pause