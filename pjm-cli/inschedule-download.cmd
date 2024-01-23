@echo off
REM 
REM Internal Schedules Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_INSCHEDULE%


REM Contracts (Active On Date mm-dd-yyyy or m/dd/yyyy)
%CLIENT% -s %APP_URL% -a /rest/secure/download/csv/contracts -q start=01-01-2012 -q stop=01-01-2012 -q pending=false

REM Schedules (Active On Date mm-dd-yyyy or m/dd/yyyy)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/schedules -q start=05-01-2012 -q stop=05-31-2012 -q pending=false

REM Reconciliations (Between Dates mm-dd-yyyy or m/dd/yyyy)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/reconciliations -q includeHeader=true -q start=05-01-2012 -q stop=05-31-2012

REM Company Static Data Report (includeHeader will put the header at top of file making it invalid CSV)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/companies -q includeHeader=false

REM EDC Loss Factors Report (includeHeader will put the header at top of file making it invalid CSV)
REM %CLIENT% -s %APP_URL% -a /rest/public/download/csv/edclossfactor -q includeHeader=true -q start=05-01-2012 -q stop=05-31-2012