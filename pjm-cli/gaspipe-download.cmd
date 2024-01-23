@echo off
REM 
REM Gas Pipeline Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.  
REM
call setEnv.cmd %1%
set APP_URL=%URL_GASPIPE%

REM Download all Gas Pipeline notifications as CSV
%CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/csv/notifications

REM Download all Gas Pipeline notifications as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/csv/notifications --csvToXml