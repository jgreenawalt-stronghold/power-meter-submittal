@echo off
REM 
REM Account Manager Download Command File 
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes a user registration call to Account Manager.
REM
call setEnv.cmd %1%
set APP_URL=%URL_ACCOUNTMANAGER%
set CONTENT_TYPE=-m application/json
set METHOD=--httpType POST

REM Example registration.json:
REM
REM {
REM     "username": "smithj",
REM     "firstName": "John",
REM     "lastName": "Smith",
REM     "jobTitle": "Engineer",
REM     "phone": "555-555-5555",
REM     "employer": "ACCT",
REM     "employedAs": "Employee",
REM     "email": "jsmith@fake.com",
REM     "accountAccess": ["PJM Public", "Power Meter Read/Write", "Planning Center Queue Point Read Only"]
REM }

REM Example success response:
REM HTTP 200
REM Content-Type:application/json
REM
REM [{"type":"INFO","lineNumber":null,"message":"Your account and access request has been submitted to your Company Account Manager for approval. You will receive an email to create your password. If your request is urgent, please <a href="http://www.pjm.com/about-pjm/who-we-are/contact-us.aspx" target="_blank">Contact PJM</a>."}]

REM Example error response:
REM HTTP 400
REM Content-Type:application/json
REM
REM [{"type":"ERROR","lineNumber":null,"message":"Access Power Meter Read/Write is not valid for Account Test Company, LLC"}]

REM %CLIENT% -s %APP_URL% %CONTENT_TYPE% %METHOD% -o registration_result.json -a /rest/secure/registrations -f .\upload\registration.json
