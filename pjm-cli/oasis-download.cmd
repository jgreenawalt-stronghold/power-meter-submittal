@echo off
REM 
REM OASIS Download Command File 
REM Copyright 2017 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Executes downloads from the PJM OASIS application.
REM
call setEnv.cmd %1%
set APP_URL=%URL_OASIS%

REM OUTPUT_FORMAT can be XML, JSON, CSV, or DATA (default OASIS format)
set FORMAT=-q OUTPUT_FORMAT=DATA
set TIMEZONE=-q RETURN_TZ=ES 
set DEFAULT_PARAMS=%FORMAT% %TIMEZONE% -q PRIMARY_PROVIDER_CODE=PJM -q PRIMARY_PROVIDER_DUNS=073647877 -q VERSION=2.1 

REM List Point Of Receipt
REM %CLIENT% -s %APP_URL% -o list_por.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=POINT_OF_RECEIPT

REM List Point Of Delivery
REM %CLIENT% -s %APP_URL% -o list_pod.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=POINT_OF_DELIVERY

REM List Paths
REM %CLIENT% -s %APP_URL% -o list_path.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=PATH_NAME

REM List Service Increments
REM %CLIENT% -s %APP_URL% -o list_increment.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=SERVICE_INCREMENT

REM List Type
REM %CLIENT% -s %APP_URL% -o list_ts_type.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=TS_TYPE

REM List Class
REM %CLIENT% -s %APP_URL% -o list_ts_class.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=TS_CLASS

REM List Subclass
REM %CLIENT% -s %APP_URL% -o list_ts_subclass.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=TS_SUBCLASS

REM List Period
REM %CLIENT% -s %APP_URL% -o list_ts_period.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=TS_PERIOD

REM List Window
REM %CLIENT% -s %APP_URL% -o list_ts_window.txt -a /rest/secure/list %DEFAULT_PARAMS% -q LIST_NAME=TS_WINDOW

REM System Data Capacity Benefit Margin
REM %CLIENT% -s %APP_URL% -o systemdata_cbm.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=CBM -q SYSTEM_ELEMENT_TYPE=PATH

REM System Data Total Transfer Capability
REM %CLIENT% -s %APP_URL% -o systemdata_ttc.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=TTC -q SYSTEM_ELEMENT_TYPE=PATH

REM System Data Firm ATC
REM %CLIENT% -s %APP_URL% -o systemdata_fatc.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=FATC -q SYSTEM_ELEMENT_TYPE=PATH

REM System Data Non-Firm ATC
REM %CLIENT% -s %APP_URL% -o systemdata_nfatc.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=NFATC -q SYSTEM_ELEMENT_TYPE=PATH

REM System Data Firm TRM
REM %CLIENT% -s %APP_URL% -o systemdata_ftrm.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=FTRM -q SYSTEM_ELEMENT_TYPE=PATH

REM System Data Non-Firm TRM
REM %CLIENT% -s %APP_URL% -o systemdata_nftrm.txt -a /rest/secure/systemdata %DEFAULT_PARAMS% -q SYSTEM_ATTRIBUTE=NFTRM -q SYSTEM_ELEMENT_TYPE=PATH

REM Messages
REM %CLIENT% -s %APP_URL% -o messages.txt -a /rest/secure/message %DEFAULT_PARAMS% -q CATEGORY=WANT_ADS -q CUSTOMER_CODE=PJM -q POSTING_REF=1 -q VALID_FROM_TIME=20170401000000ES -q VALID_TO_TIME=20170430000000ES

REM Transmission Request Status
%CLIENT% -s %APP_URL% -o transstatus.txt -a /rest/secure/transstatus %DEFAULT_PARAMS%  -q ASSIGNMENT_REF=123 -q CUSTOMER_CODE=XXX -q CUSTOMER_DUNS=999999999 -q POINT_OF_DELIVERY=ALTE -q POINT_OF_RECEIPT=PJM -q SELLER_CODE=PJM -q SELLER_DUNS=073647877

