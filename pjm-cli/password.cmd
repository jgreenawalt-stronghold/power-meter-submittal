@echo off
REM 
REM Encrypt Password
REM Copyright 2012 PJM Interconnection LLC
REM http://www.pjm.com
REM
REM Description: 
REM Use this function to encrypt a password for CLI so you don't have to store your password plaintext.
REM The output password is wrapped in ENC(...) and the entire ENC(...) must be used as the password to 
REM indicate that the password is encrypted.  If not wrapped in ENC(..) CLI assumes plain text password.
REM 
call setEnv.cmd

REM Encrypt password
java %MEMARGS% -classpath %CLASSPATH% com.pjm.web.cli.Encrypt -p %1
