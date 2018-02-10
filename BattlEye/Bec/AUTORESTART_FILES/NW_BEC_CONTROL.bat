:top
TIMEOUT /T 1 /NOBREAK

cd C:\DZE_Server_Config\BattlEye\Bec
Bec.exe -f Config.cfg --dsc

ping 127.0.0.1 -n 2 >NUL
start /wait "" /min "C:\DZE_Server_Config\BattlEye\Bec" -f config.cfg --dsc

ping 127.0.0.1 -n 2 >NUL
echo DO NOT WORRY BEC IS TRYING TO RECONECT...
goto top 
