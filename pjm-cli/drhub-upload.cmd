@echo off
REM 
REM DR Hub Upload Command File 
REM Copyright 2016 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes uploads to the PJM application.  
REM
call setEnv.cmd %1%
set APP_URL=%URL_DRHUB%

REM ACKNOWLEDGE LOAD MANAGEMENT EVENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/loadmanagement/acknowledge/ -file .\upload\loadManagementEvents.xml

REM ACKNOWLEDGE REAL TIME DISPATCH EVENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/realtimedispatch/acknowledge/ -file .\upload\realTimeDispatchEvent.xml

REM ACKNOWLEDGE SYNCHRONIZED RESERVE EVENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/synchronizedreserve/acknowledge/ -file .\upload\synchronizedReserveEvents.xml

REM ACKNOWLEDGE ZONAL EMERGENCY ENERGY EVENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/zonalemergencyenergy/acknowledge/ -file .\upload\zonalEmergencyEnergyEvents.xml

REM TEST LOAD MANAGEMENT SUMMARY
REM Upload Test Load Management Summary -- Create
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/testloadmanagementsummary/create/ -file .\upload\loadManagementTestEvents.xml

REM TEST LOAD MANAGEMENT SUMMARY
REM Upload Test Load Management Summary - Update
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/testloadmanagementsummary/12345 -file .\upload\loadManagementTestEvents.xml

REM ACKNOWLEDGE TEST LOAD MANAGEMENT EVENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/event/testloadmanagementevent/acknowledge/ -file .\upload\testLoadManagementEvents.xml

REM UPLOAD METER DATA DAILY
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/meterdata/daily/ -file .\upload\meterDataDaily.xml

REM UPLOAD METER DATA INTERVAL
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/meterdata/interval/ -file .\upload\meterDataInterval.xml

REM UPLOAD METER DATA EXPECTED REDUCTION
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/meterdata/expected-reduction/ -file .\upload\meterDataExpectedReduction.xml

REM CONFIRM SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/settlement/12345/confirm

REM DENY SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/settlement/12345/deny -q comment "This is a comment"

REM DISPUTE SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/settlement/12345/dispute

REM WITHDRAW SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/settlement/12345/withdraw

REM SUBMIT SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/settlement/12345/submit

REM MODIFY SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/settlement/modify -file .\upload\settlement.xml

REM CREATE CBL TEST FOR REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/cblcalculation/cbltest/execute/ -file .\upload\cblTest.xml

REM CREATE CBL CALCULATION FOR SETTLEMENT
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/cblcalculation/settlement/execute/ -file .\upload\cblCalculation.xml

REM CREATE REGISTRATION 
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/registration/create -file .\upload\registration.xml

REM UPDATE REGISTRATION 
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/registration/12345/ -file .\upload\registration.xml

REM SUBMIT REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/registration/12345/submit

REM WITHDRAW REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/registration/12345/withdraw

REM DISPUTE REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/registration/12345/dispute -q comment "This is a comment"

REM TERMINATE REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/registration/12345/terminate -q terminateDate=05-31-2009

REM EXTEND REGISTRATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/registration/12345/extend -q terminateDate=05-31-2009

REM CALCULATE WINTER PEAK LOAD FOR REGISTRATIONS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/registration/calculatewpl -file .\upload\registration.xml

REM COMPLETE REGISTRATIONS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/registration/complete -file .\upload\registration.xml

REM UPLOAD REGISTRATION DOCUMENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/registration/1234/document -m "application/octet-stream" -q registrationDocumentType=SYNCH_RESERVE -q description="This file description." -file .\upload\MyFile.docx

REM UPLOAD LOCATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/location/create -file .\upload\location.xml

REM MODIFY LOCATION
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/location/12345 -file .\upload\location.xml

REM UPLOAD LOCATION DOCUMENTS
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/location/1234/document -m "application/octet-stream" -q description="This file description." -file .\upload\MyFile.docx

REM TASK
REM Upload EDC Registration Tasks
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/task/registration/edc -file .\upload\edc-registration-task.xml

REM Upload LSE Registration Tasks
REM %CLIENT% -s %APP_URL% -a /rest/secure/upload/task/registration/lse -file .\upload\lse-registration-task.xml