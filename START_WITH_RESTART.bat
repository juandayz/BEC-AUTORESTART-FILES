@echo off

::CONFIG SETTINGS
set becPath="C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES"
set serverPath="C:\epoch"
set DB_USERNAME="YourMysqlUser"
set DB_PASSWORD="YourMysqlPass"
set DB_NAME="YourDataBaseName"

::END SETTINGS
:arma2oaserver
echo NW MONITOR STARTING...
FOR /F "tokens=1-4 DELIMS=/ " %%F IN ('date /T') DO (set v_date=%%F%%G%%H)
FOR /F "tokens=1-4 DELIMS=: " %%F IN ('time /T') DO (set v_time=%%F%%G%%H)
set fname=database_%v_date%_%v_time%.sql

ping 127.0.0.1 -n 5 >NUL

title Monitor 
cd %becPath%
echo (%time%) LOADING BEC.
start "NW_BEC_CONTROL" "NW_BEC_CONTROL.bat"
cd %serverPath%
echo (%time%) NW SERVER STARTING.
start /wait "arma2" /min "C:\epoch\arma2oaserver.exe" -port=2302 -autoInit -noSound -noPause "-config=C:\DZE_Server_Config\24_napf.cfg" "-cfg=C:\DZE_Server_Config\basic.cfg" "-profiles=C:\DZE_Server_Config" -name=DZE_Server_Config "-mod=@DayZ_Epoch;@DayZ_Epoch_Server;" 
echo (%time%) WARNING: AUTORESTART IS ACTIVE NOW
goto arma2oaserver
