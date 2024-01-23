@echo off
REM 
REM JCM Ramp Viewer Download Command File 
REM Copyright 2014 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads from the PJM application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_JCM%

REM Ramp Available (Composite View from PJM)
%CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/xml/jcmramp/ -q view=COMPOSITE -q location=PJM

REM Ramp Available (Composite View from MISO)
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/xml/jcmramp/ -q view=COMPOSITE -q location=MISO

REM Ramp Available (PJM View)
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/xml/jcmramp/ -q view=PJM

REM Ramp Available (MISO View)
REM %CLIENT_PUBLIC% -s %APP_URL% -a /rest/public/download/xml/jcmramp/ -q view=MISO