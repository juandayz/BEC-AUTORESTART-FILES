@echo off
echo SHUTDOWN ARMA2OA SERVER
TIMEOUT /T 2 /NOBREAK
taskkill /F /IM arma2oaserver.exe


set cleanuplogs="C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES"
cd /d %cleanuplogs%
start "" "clean_logs.bat"
echo SUCCESS


timeout 3
exit




