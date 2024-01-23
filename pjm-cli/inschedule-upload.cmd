@echo off
REM 
REM Internal Schedules Upload Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_INSCHEDULE%

REM Upload schedules or reconciliation files legacy format
%CLIENT% -s %APP_URL% --action /rest/secure/upload/file/ -file .\upload\IS-BADPRECISION.txt