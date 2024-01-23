@echo off
REM 
REM OASIS Upload Command File 
REM Copyright 2017 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM OASIS application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_OASIS%
set CONTENT_TYPE=-m text/x-oasis-csv

REM Post a new message
%CLIENT% -s %APP_URL% %CONTENT_TYPE% -o messagepost_result.txt -a /rest/secure/messagepost -file .\upload\messagepost.txt

REM Delete Messages
REM %CLIENT% -s %APP_URL% %CONTENT_TYPE% -o messagedelete_result.txt -a /rest/secure/messagedelete -file .\upload\messagedelete.txt

REM Transmission Request
REM %CLIENT% -s %APP_URL% %CONTENT_TYPE% -o transrequest_result.txt -a /rest/secure/transrequest -file .\upload\transrequest.txt

REM Transmission Request (HOURLY)
REM %CLIENT% -s %APP_URL% %CONTENT_TYPE% -o pjmtransreq_result.txt -a /rest/secure/pjmtransreq -file .\upload\pjmtransreq.txt
