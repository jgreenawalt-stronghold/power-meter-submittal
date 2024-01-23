@echo off
REM 
REM External Schedules Upload Command File 
REM Copyright 2013 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_EXSCHEDULE%

REM Upload a day ahead bid. If <bidName> is used it will be a modification, else it will create a new Bid
%CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/bid/ --file .\upload\dabid-upload.xml

REM Withdraw the entire Day Ahead Bid
REM %CLIENT% -s %APP_URL% --action /rest/secure/withdraw/bid -q bid=T2000120

REM Withdraw the specific profile from Day Ahead Bid
REM %CLIENT% -s %APP_URL% --action /rest/secure/withdraw/bid -q bid=T2000120 -q profile=PENDING_OASIS

REM Upload a ramp reservation. If <reservationName> is used it will be a modification, else it will create a new Reservation
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/reservation/ --file .\upload\reservation-upload.xml

REM Withdraw the non-valid profiles from Ramp Reservation
REM %CLIENT% -s %APP_URL% --action /rest/secure/withdraw/reservation -q reservation=ALTE2000008

REM Upload a batch of reservations together to be evaluated against Ramp together
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/reservationbatch/ --file .\upload\reservation-batch.xml

REM Upload a CTS bid. If <bidName> is used it will be a modification, else it will create a new Bid
REM %CLIENT% -s %APP_URL% --action /rest/secure/upload/xml/ctsbid/ --file .\upload\ctsbid-upload.xml

REM Withdraw the entire CTS Bid
REM %CLIENT% -s %APP_URL% --action /rest/secure/withdraw/ctsbid -q bid=CTS2000120

REM Withdraw the specific profile from CTS Bid
REM %CLIENT% -s %APP_URL% --action /rest/secure/withdraw/ctsbid -q bid=CTS2000120 -q profile=REQUESTED