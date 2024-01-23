@echo off
REM 
REM DART Download Command File 
REM Copyright 2017 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads from the PJM DART application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_DART%

REM EMS outage
%CLIENT% -s %APP_URL% -a /rest/secure/download --httpType POST -q downloadtype=emsoutage 
pause