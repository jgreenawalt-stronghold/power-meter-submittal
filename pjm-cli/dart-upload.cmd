@echo off
REM 
REM DART Upload Command File 
REM Copyright 2017 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM DART application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_DART%

REM file upload (replace with your file) 
%CLIENT% -s %APP_URL% -a /rest/secure/upload --httpType POST -f C:/path/to/file
pause