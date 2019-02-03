PLEASE DONATE: https://github.com/juandayz/BEC-AUTORESTART-FILES/blob/master/DONATION.md


Scheduler# BEC-AUTORESTART-FILES

DESIGNED FOR LOCAL MACHINES OR VIRTUAL ONES.

AUTORESTART FILES EVERY 3hs. ( anyway you can change it )

**INSTALL:**

1-Drop Battleye Folder and START_WITH_RESTART.bat into your DZE_Server_Config

2-Now we need edit some paths and database , user and pass values. so.

A.Open START_WITH_RESTART.bat and change those values for your owns:
```ruby
set becPath="C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES"
set serverPath="C:\epoch"
set DB_USERNAME="YourMysqlUser"
set DB_PASSWORD="YourMysqlPass"
set DB_NAME="YourDataBaseName"

start /wait "arma2" /min "C:\epoch\arma2oaserver.exe" -port=2302 -autoInit -noSound -noPause "-config=C:\DZE_Server_Config\24_napf.cfg" "-cfg=C:\DZE_Server_Config\basic.cfg" "-profiles=C:\DZE_Server_Config" -name=DZE_Server_Config "-mod=@DayZ_Epoch;@DayZ_Epoch_Server;" 

```

B.Open BEServer.cfg and entry a new pass:
```ruby
RConPassword PUTYOURPASS
```

C.Open Config.cfg and change the path for your own.
```ruby
BePath = C:\DZE_Server_Config\BattlEye
```

D.Open Scheduler.xml and change this path in every job group.
```ruby
<cmd>C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES\NW_SHUTDOWN.bat</cmd>
```
E.Open clean_logs.bat and change by your own path:
```ruby
set srvname=C:\DZE_Server_Config
```
F.Open NW_BEC_CONTROL.bat and change by your path:
```ruby
cd "C:\DZE_Server_Config\BattlEye\Bec"
```
G.Open NW_SHUTDOWN.bat and change by your path
```ruby
set cleanuplogs="C:\DZE_Server_Config\BattlEye\Bec\AUTORESTART_FILES"
```

**NOW LAUNCH YOUR SERVER WITH START_WITH_RESTART.bat


**NOTE:** The cleanupEvents.sql and findvehicleswithoutkeyFunction.sql are sql events and functions. YOu can load them from any kind of program like navicat or heidysql.
