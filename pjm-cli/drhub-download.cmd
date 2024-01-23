@echo off
REM 
REM DR Hub Download Command File 
REM Copyright 2016 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads to the PJM application.  
REM
call setEnv.cmd %1%
set APP_URL=%URL_DRHUB%

REM DR Hub Event Options
REM Event Options: startDate, stopDate
REM type default value (if not specified): Retrieves all events for the current day.

REM EVENT DOWNLOADS

REM DAY AHEAD ENERGY EVENT
REM Download Day Ahead Energy Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/dayaheadenergy/12345

REM Download Day Ahead Energy Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/dayaheadenergy -q startDate=05-01-2009 -q stopDate=05-31-2009

REM LOAD MANAGEMENT EVENT
REM Download Load Management Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/loadmanagement/12345

REM Download Load Management Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/loadmanagement -q startDate=05-01-2009 -q stopDate=05-31-2009

REM Download Load Management Events which are acknowledgeable
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/loadmanagement/acknowledgeable

REM LOAD MANAGEMENT SUMMARY
REM Download Load Management Summary by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/loadmanagementsummary/12345

REM Download Load Management Summaries with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/loadmanagementsummary -q startDate=09-01-2013 -q stopDate=09-02-2013

REM TEST LOAD MANAGEMENT SUMMARY
REM Download Test Load Management Summary by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/testloadmanagementsummary/12345

REM Download Test Load Management Summary with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/testloadmanagementsummary -q startDate=09-01-2013 -q stopDate=09-02-2013

REM TEST LOAD MANAGEMENT EVENT
REM Download Test Load Management EVENT by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/testloadmanagementevent/12345

REM Download Test Load Management Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/testloadmanagementevent -q startDate=01-01-2019 -q stopDate=01-04-2019

REM Download Test Load Management Events which are acknowledgeable
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/testloadmanagementevent/acknowledgeable

REM REAL TIME DISPATCH EVENT
REM Download Real Time Dispatch Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/realtimedispatch/12345

REM Download Real Time Dispatch Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/realtimedispatch -q startDate=05-01-2009 -q stopDate=05-31-2009

REM Download Real Time Dispatch Events which are acknowledgeable
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/realtimedispatch/acknowledgeable

REM REAL TIME DISPATCH SUMMARY
REM Download Real Time Dispatch Summary by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/realtimedispatchsummary/12345

REM Download Real Time Dispatch Summaries with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/realtimedispatchsummary -q startDate=09-01-2013 -q stopDate=09-02-2013

REM RESOURCE OUTAGE EVENT
REM Download Resource Outage Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/resourceoutage/12345

REM Download Resource Outage Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/resourceoutage -q startDate=09-01-2013 -q stopDate=09-02-2013

REM SYNCHRONIZED RESERVE EVENT
REM Download Synchronized Reserve Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/synchronizedreserve/12345

REM Download Synchronized Reserve Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/synchronizedreserve -q startDate=09-01-2013 -q stopDate=09-02-2013

REM Download Synchronized Reserve Events which are acknowledgeable
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/synchronizedreserve/acknowledgeable

REM SYNCHRONIZED RESERVE SUMMARY
REM Download Synchronized Reserve Summary by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/synchronizedreservesummary/12345

REM Download Synchronized Reserve Summaries with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/synchronizedreservesummary -q startDate=09-01-2013 -q stopDate=09-02-2013

REM ZONAL EMERGENCY ENERGY EVENT
REM Download Zonal Emergency Energy Event by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/zonalemergencyenergy/12345

REM Download Zonal Emergency Energy Events with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/zonalemergencyenergy -q startDate=09-01-2013 -q stopDate=09-02-2013

REM Download Zonal Emergency Energy Events which are acknowledgeable
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/zonalemergencyenergy/acknowledgeable

REM ZONAL EMERGENCY ENERGY SUMMARY
REM Download Zonal Emergency Energy Summary by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/zonalemergencyenergysummary/12345

REM Download Zonal Emergency Energy Summaries with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/event/zonalemergencyenergysummary -q startDate=09-01-2013 -q stopDate=09-02-2013


REM SETTLEMENT DOWNLOADS
REM DR Hub Settlement Options
REM Settlement Options: startDate, stopDate, status
REM type default value (if not specified): Retrieves all settlements for the current day.

REM Download Settlement by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/settlement/12345

REM Download Settlement with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/settlement -q startDate=05-01-2009 -q stopDate=05-31-2009 -q status=CONFIRMED

REM DR Hub Meter Data Options
REM Meter Data Options: startDate, stopDate, registrationId, locationId
REM must provide either registrationId, locationId, or both
REM For Daily and Interval - date range default value (if not specified): Retrieves all Meter Data for the past 100 days.




REM METER DATA DOWNLOADS

REM METER DATA DAILY

REM Download Meter Data Daily with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/meterdata/daily -q registrationId=12345 -q locationId=12345 -q startDate=05-01-2009 -q stopDate=05-31-2009

REM METER DATA INTERVAL

REM Download Meter Data Interval with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/meterdata/interval -q registrationId=12345 -q locationId=12345 -q startDate=05-01-2009 -q stopDate=05-31-2009

REM Download Meter Data Expected Reduction with Parameters
REM For Expected Reduction - date range default value (if not specified): Retrieves all Meter Data for the next upcoming 35 days.
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/meterdata/expected-reduction -q zones=BGE,XYZ -q startDate=08-01-2016 -q stopDate=08-31-2016




REM LOCATION DOWNLOADS

REM Download Location by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/location/12345

REM Download Locations with Parameters Find by IDs comma-separated list
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/location -q ids=12345,67891 

REM Download Locations with Parameters Find by Name - supports partial name queries for starts with, contains, ends with
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/location -q name=Phila

REM Download Locations with All Parameters
REM name - supports partial name queries for starts with, contains, ends with
REM zones - comma-separated list of zone names
REM edcAccountNumber - supports partial EDC Account Number queries for starts with, contains, ends with
REM lastModifiedDate - filters locations to only those that have been modified as of the given date
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/location -q name=Phila -q zones=ZONE1,ZONE2 -q edcAccountNumber=DC123 -q lastModifiedDate=08-31-2016

REM Download Location documents in ZIP Archive
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/location/1234/document

REM REGISTRATION DOWNLOADS
REM Download Registrations by Registration ID, a Date Range, Registration Status, Or Name
REM Registration Options: startDate, stopDate, status, name
REM Date range default value (if not specified): Retrieves all Registrations for the past 730 days.

REM Download Registration by ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/registration/12345

REM Download Registration with Parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/registration -q startDate=01-01-2016 stopDate=12-31-2016 -q status=NEW,CONFIRMED -q name=State University -q lastModifiedDate=08-31-2016

REM Download Registration documents in ZIP Archive
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/registration/1234/document -q registrationDocumentType=SYNCH_RESERVE



REM CBL DOWNLOADS
REM Download CBL Test for Registrations by Registration ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/cblcalculation/cbltest/12345

REM Download CBL Calculation for Settlement by Settlement ID
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/cblcalculation/settlement/12345




REM TASK DOWNLOADS
REM Download All Tasks
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/task/

REM Download EDC Registration Tasks
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/task/registration/edc

REM Download LSE Registration Tasks
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/task/registration/lse

REM COMPLIANCE DOWNLOADS
REM Download Compliance records for parameters
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/compliance/ -q registrationId=12345 -q startDate=01-01-2016 -q stopDate=12-31-2016 -q status=NEW

REM Validate Compliance records with parameter ids
REM %CLIENT% -s %APP_URL% -a /rest/secure/download/compliance/validate/ -q ids=12345,12346,12347,12348