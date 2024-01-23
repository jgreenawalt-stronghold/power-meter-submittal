@echo off
REM 
REM External Schedules Download Command File 
REM Copyright 2013 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads from the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_EXSCHEDULE%

REM Schedules (Today's Date Default)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/schedules

REM Schedules (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/schedules -q start=04-01-2013 -q stop=04-30-2013

REM Schedules (Date Range + filtered status)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/schedules -q start=04-01-2013 -q stop=04-30-2013 -q status=Working,Expired

REM Tag Reservations (Today's Date Default)
%CLIENT% -s %APP_URL% -a /rest/secure/download/xml/tagreservations

REM Tag Reservations (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/tagreservations -q start=04-01-2013 -q stop=04-30-2013

REM Ramp Reservations (Today's Date Default)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/reservations

REM Ramp Reservations (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/reservations -q start=04-01-2013 -q stop=04-30-2013

REM Ramp Reservation (by Name)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/reservation -q reservation=ALTE2000008

REM Day Ahead Bids (Today's Date Default)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/bids

REM Day Ahead Bids (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/bids -q start=04-01-2013 -q stop=04-30-2013

REM Day Ahead Bid (by Name)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/bid -q bid=T2000120

REM CTS Bids (Today's Date Default)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/ctsbids

REM CTS Bids (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/ctsbids -q start=04-01-2013 -q stop=04-30-2013

REM CTS Bid (by Name)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/ctsbid -q bid=CTS2000120

REM Ramp Available (Now Plus 72 hours)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/ramp/

REM Credit usage (Today's Date Default)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/creditusage

REM Credit usage (Date Range)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/creditusage -q start=04-01-2013 -q stop=04-30-2013

REM Interchange Available (Now Plus 72 hours)
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/xml/interchange/

