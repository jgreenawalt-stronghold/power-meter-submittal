@echo off
REM 
REM Power Meter Upload Command File 
REM Copyright 2013 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM application.
REM

call setEnv.cmd %1%
set APP_URL=%URL_POWERMETER%

REM Upload Daily/Five Minute Submission XML
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/dailysubmission/ -file .\upload\hourlyMeterValues.xml

REM Upload Five Minute Submission CSV
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/csv/fiveminutesubmission/ -m text/csv -file .\upload\fiveMinuteMeterValues.csv

REM Upload Load Submission
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/loadsubmission/ -file .\upload\hourlyLoadValues.xml

REM Upload Monthly Correction
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/monthlycorrection/ -file .\upload\monthlyCorrection.xml