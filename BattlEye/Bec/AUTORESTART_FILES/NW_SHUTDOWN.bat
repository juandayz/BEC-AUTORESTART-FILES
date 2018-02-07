@echo off
echo SHUTDOWN ARMA2OA SERVER
TIMEOUT /T 2 /NOBREAK
taskkill /F /IM arma2oaserver.exe
TIMEOUT /T 4 /NOBREAK
echo SHUTDOWN DEAD BEC
taskkill /f /im cmd.exe /fi "windowtitle eq NW_BEC_CONTROL

set cleanuplogs="C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES"
cd /d %cleanuplogs%
start "" "clean_logs.bat"
echo SUCCESS


timeout 3
exit




