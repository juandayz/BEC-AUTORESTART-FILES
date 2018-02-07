@echo off

set srvname=C:\DZE_Server_Config
set servername=%srvname%
TITLE  DayZ %servername% Server Log Rotater


del /Q /F "%servername%\arma2oaserver.RPT"
del /Q /F "%servername%\arma2oaserver.mdmp"
del /Q /F "%servername%\arma2oaserver.bidmp"
del /Q /F "%servername%\server_log.txt"
del /Q /F "%servername%\HiveExt.log"


:: We're done here.
exit