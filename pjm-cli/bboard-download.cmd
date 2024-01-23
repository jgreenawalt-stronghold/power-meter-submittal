@echo off
REM 
REM Bulletin Board Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.  
REM
call setEnv.cmd %1%
set APP_URL=%URL_BULLETIN%

REM Download all Bulletin Board Postings as CSV
%CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/csv/postings

REM Download all Bulletin Board Postings as XML
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/csv/postings --csvToXml