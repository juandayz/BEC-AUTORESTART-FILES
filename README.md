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
  
