@echo off
REM 
REM MSRS Download Command File 
REM Copyright 2020 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes commands to download reports from MSRS  
REM
call setEnv.cmd %1%
set APP_URL=%URL_MSRS%

REM MSRS Download Reports Query Parameter Options

REM shortName: the short name of the report in compact form (all lowercase and no spaces)
REM start: the start date of the selection date range (MM-dd-yyyy)
REM stop: the stop date of the selection date range (MM-dd-yyyy)
REM version: the version of the report. Valid values are L (Latest), B (Latest Billed), O (Original Billed), A (All Billed)
REM format: the format of the report. Valid values are C (CSV), X (XML), P (PDF)
REM requestAll: optional flag to allow SUMA users to request a report with information from all of their available accounts.
REM 			Defaults to false. Valid values are true or false.


REM For SUMA users requesting reports for any one of their available accounts, please set the ACCOUNT variable in the setenv.cmd script


REM Download XML Report of latest Monthly Billing Statement
%CLIENT% -s %APP_URL% -a /rest/secure/download/reports -q shortName=monthlybillingstatement-csvandxml -q start=04-03-2020 -q stop=04-20-2020 -q version=L -q format=X

REM Download PDF Report of original billed Weekly Billing Statement 
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/reports -q shortName=weeklybillingstatement-onlineandpdf -q start=04-03-2020 -q stop=04-20-2020 -q version=O -q format=P

REM Download CSV Report of latest Monthly Billing Statement for all available accounts (must be logged in as a SUMA user)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/reports -q shortName=monthlybillingstatement-csvandxml -q start=04-03-2020 -q stop=04-20-2020 -q version=L -q format=C -q requestAll=true

REM Download a list of report names that are available to be downloaded
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/reportNames





