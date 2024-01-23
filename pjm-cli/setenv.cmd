REM 
REM PJM Command Line Interface 
REM Copyright 2020 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Command line client for uploading and downloading files from PJM.
REM Example .CMD files are included demonstrating how to call each function.
REM 
REM usage: pjm-cli
REM -a,--action <String>         Action to execute
REM -c,--csvToXml                Convert CSV download to XML format(optional)              
REM -d,--directory <Directory>   Directory location of destination output (required)
REM -f,--file <File>             File location of upload file (required if this is an upload operation)
REM -k,--cookies                 Disables cookie storage reducing performance and requiring SSO login on every call. (not recommended for most users)
REM -l,--logging <Level>         Log level of output TRACE, DEBUG, INFO, WARN, ERROR (default INFO)
REM -m,--mimeType <String>       Specify MIME file type, defaults to text/plain
REM -o,--output <File>           Output result file or downloaded file(optional - will use name sent from application)
REM -q,--query <param=value>     Query parameters to append to URL (optional)
REM -h,--header <param=value>    Header parameters to attach (optional)
REM -s,--serviceUrl <URL>        PJM Application URL
REM -u,--username <String>       Account Manager Username
REM -p,--password <String>       Account Manager Password (either encrypted or clear text)
REM -r,--certificate             PKI certificate location | PKI certificate password (either encrypted or clear text)
REM -x,--proxy <param=value>     Proxy parameters for internet proxy in form of proxyPort=8000 for proxyHost, proxyPort, proxyPortSsl, proxyUser, proxyPassword(optional)
REM -z,--timeout <milliseconds>  Socket and connect timeout in milliseconds, defaults to 180000 (optional)
REM  
REM NOTE: Please customize to match your environment
REM


IF "%1%" == "PROD"  (
  REM PRODUCTION
  REM DO NOT REMOVE - This is used to clear out any previous suma account variables
  set ACCOUNT=
  set URL_ACCOUNTMANAGER=https://accountmanager.pjm.com/accountmanager/
  set URL_BULLETIN=https://bboard.pjm.com/bulletinboard/
  set URL_DART=https://edartsso.pjm.com/edart/
  set URL_DRHUB=https://drhub.pjm.com/drhub/
  set URL_EMERGPROC=https://emergencyprocedures.pjm.com/ep/
  set URL_EXSCHEDULE=https://exschedule.pjm.com/exschedule/
  set URL_GASPIPE=https://gaspipe.pjm.com/gaspipe/
  set URL_INSCHEDULE=https://insched.pjm.com/inschedule/
  set URL_JCM=https://exschedule.pjm.com/jcmramp/
  set URL_OASIS=https://pjmoasis.pjm.com/OASIS/
  set URL_OUTAGES=https://customeroutages.pjm.com/outages/
  set URL_POWERMETER=https://powermeter.pjm.com/powermeter/
  set URL_MSRS=https://msrsapp.pjm.com/msrs/
) ELSE (
  REM TRAINING SANDBOX
  REM DO NOT REMOVE - This is used to clear out any previous suma account variables
  set ACCOUNT=
  set URL_ACCOUNTMANAGER=https://accountmanagertrain.pjm.com/accountmanager/
  set URL_BULLETIN=https://bboardtrain.pjm.com/bulletinboard/
  set URL_DART=https://edartssotrain.pjm.com/edart/
  set URL_DRHUB=https://drhubtrain.pjm.com/drhub/
  set URL_EMERGPROC=https://emergencyprocedurestrain.pjm.com/ep/
  set URL_EXSCHEDULE=https://exscheduletrain.pjm.com/exschedule/
  set URL_GASPIPE=https://gaspipetrain.pjm.com/gaspipe/
  set URL_INSCHEDULE=https://inschedtrain.pjm.com/inschedule/
  set URL_JCM=https://exscheduletrain.pjm.com/jcmramp/
  set URL_OASIS=https://oasistrain.pjm.com/OASIS/
  set URL_OUTAGES=https://customeroutagestrain.pjm.com/outages/
  set URL_POWERMETER=https://powermetertrain.pjm.com/powermeter/
  set URL_MSRS=https://msrsapptrain.pjm.com/msrs/
)

REM (Optional) If you are a SUMA user and have multiple accounts set the specific to use. Primary account will be used by default.
REM set ACCOUNT=-h Suma-Account=ABCD

REM JAVA should contain a pointer to a Java 8+ JRE \bin\java.exe executable
set JAVA=Y:\jdk1.8.0_181\jre\bin\java.exe

REM MEMARGS Java Virutal Machine memory arguments
set MEMARGS=-Xms64m -Xmx256m

REM CLASSPATH location of the pjm-cli.jar (default to current directory)
set CLASSPATH=pjm-cli.jar

REM USER your PJM username
set USER=pjmuser

REM PSWD your PJM password (can be plaintext or encrypted ENC(...) if encrypted using password.cmd)
set PSWD=ENC(9ASkZOjxCw4MKxM+rtpL/7p4bLT7kPHy)

REM Certificate information if PKI certs are required (cert location | password)
REM set CERTIFICATE=-r "./cert/mycert.pfx|ENC(9ASkZOjxCw4MKxM+rtpL/7p4bLT7kPHy)"

REM DOWNLOADS Output directory for file downloads or results of file uploads
set DOWNLOADS=./download/

REM If you use a Proxy uncomment one of these lines depending on whether you use a username or password
set PROXY=
REM set PROXY=-x proxyHost=myHost -x proxyPort=80 -x proxyPortSsl=80
REM set PROXY=-x proxyHost=myHost -x proxyPort=80 -x proxyPortSsl=80 -x proxyUser=myProxyUser -x proxyPassword=myProxyPass

REM You can configure the socket timeout (in milliseconds) here to be longer if you are getting timeouts on large files. Default to 3 minutes.
set TIMEOUT=-z 180000

REM CLIENT_PUBLIC is the command line created and used for public URLS
set CLIENT_PUBLIC=%JAVA% %MEMARGS% -jar %CLASSPATH% -d %DOWNLOADS% %PROXY% %TIMEOUT% 

REM CLIENT is the command line created and used by all other .cmd files in this directory
set CLIENT=%CLIENT_PUBLIC% -u %USER% -p %PSWD% %CERTIFICATE% %ACCOUNT%

