@echo off
REM 
REM Power Meter Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.  
REM
call setEnv.cmd %1%
set APP_URL=%URL_POWERMETER%

REM Power Meter Options
REM type Options: all, gen, tie

REM type default value (if not specified): all
REM start default value (if not specified): previous business day
REM stop default value (if not specified): previous business day + one day


REM EDC LOSS FACTORS
REM Download EDC Loss Factors CSV with defaults
%CLIENT% -s %APP_URL% -a /rest/public/download/csv/edclossfactor

REM Download EDC Loss Factors CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/public/download/csv/edclossfactor -q start=12-01-2020 -q stop=12-31-2020 -q includeHeader=false


REM DAILY ALLOCATION
REM Download Daily Allocation CSV Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/dailyallocation

REM Download Daily Allocation CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/dailyallocation -q start=09-01-2013 -q stop=09-02-2013 -q type=tie

REM Download Daily Allocation XML Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/dailyallocation

REM Download Daily Allocation XML with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/dailyallocation -q start=09-01-2013 -q stop=09-02-2013 -q type=tie


REM FIVE MINUTE SUBMISSION
REM Download Five Minute Submission CSV Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/fiveminutesubmission

REM Download Five Minute Submission CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/fiveminutesubmission -q start=09-01-2013 -q stop=09-02-2013 -q type=gen

REM Download Five Minute Submission XML Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/fiveminutesubmission

REM Download Five Minute Submission XML with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/fiveminutesubmission -q start=09-01-2013 -q stop=09-02-2013 -q type=tie


REM DAILY SUBMISSION
REM Download Daily Submission CSV Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/dailysubmission

REM Download Daily Submission CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/dailysubmission -q start=09-01-2013 -q stop=09-02-2013 -q type=gen

REM Download Daily Submission XML Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/dailysubmission

REM Download Daily Submission XML with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/dailysubmission -q start=09-01-2013 -q stop=09-02-2013 -q type=tie



REM LOAD SUBMISSION 
REM Download Load Submission CSV Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/loadsubmission

REM Download Load Submission CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/loadsubmission -q start=09-01-2013 -q stop=09-02-2013

REM Download Load Submission XML Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/loadsubmission

REM Download Load Submission XML with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/loadsubmission -q start=09-01-2013 -q stop=09-02-2013



REM METER ACCOUNT
REM Download Meter Account CSV Defaults (Id required)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/meteraccount -q id=12345

REM Download Meter Account CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/meteraccount -q date=09-01-2013 -q id=12345

REM Download Meter Account XML Defaults (Id required)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/meteraccount -q id=12345

REM Download Meter Account XML with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/meteraccount -q date=09-01-2013 -q id=12345



REM METER ACCOUNTS
REM Download Meter Account CSV Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/meteraccounts

REM Download Meter Account CSV with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/meteraccounts -q date=09-01-2013 -q type=tie

REM Download Meter Account XML Defaults
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/meteraccounts

REM Download Meter Account (Date and Type) XML
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/meteraccounts -q date=09-01-2013 -q type=tie



REM MONTHLY CORRECTION
REM Download Monthly Correction (Default start = previous business day, stop = start date + one day, type = all) CSV
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/monthlycorrection

REM Download Monthly Correction (Date Range and Type) CSV
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/csv/monthlycorrection -q start=09-01-2013 -q stop=09-02-2013 -q type=tie

REM Download Monthly Correction (Default start = previous business day, stop = start date + one day, type = all) XML
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/monthlycorrection

REM Download Monthly Correction (Date Range and Type) XML
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/monthlycorrection -q start=09-01-2013 -q stop=09-02-2013 -q type=tie