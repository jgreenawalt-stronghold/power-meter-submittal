@echo off
REM 
REM Account Manager Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_ACCOUNTMANAGER%

REM User Search
REM Available search criteria are (* wildcard available):
REM -q username*
REM -q activeOnly (T/F - defaults to T)
REM -q accountId
REM -q accountName*
REM -q accountShortName*
REM -q firstName*
REM -q lastName*
REM -q systemId (T/F - defaults to show all)
REM -q emailAddress*
REM -q phone*

REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/userSearch -q firstName="John" -q lastName="Smith"
