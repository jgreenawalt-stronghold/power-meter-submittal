@echo off
REM 
REM Emergency Procedures Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Downloads the Emergency Procedures Postings 
REM
call setEnv.cmd %1%
set APP_URL=%URL_EMERGPROC%

REM Download all Emergency Procedures Postings for the last 2 days as XML
%CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting

REM Download all Emergency Procedures Postings for the specified date range as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting -q start=01-01-2014 -q stop=01-31-2014

REM Download only active Emergency Procedures Postings as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting?activeOnly=true

REM Download only PAI Emergency Procedures Postings for the last 2 days as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting?paiOnly=true

REM Download all Emergency Procedures Postings for the last 2 days, excluding PJM drills as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting?pjmDrill=exclude

REM Download all Emergency Procedures Postings with a Prioirty type of Informational for the last 2 days as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/posting?priority=informational
