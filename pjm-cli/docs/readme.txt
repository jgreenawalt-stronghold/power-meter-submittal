-----------------------------------------------------------------------------------
PJM Command Line Interface
Browserless Command line client for uploading and downloading files from PJM Web Tools.
 
Copyright (C) 2012-2020 PJM Interconnection LLC
Web: http://www.pjm.com/
-----------------------------------------------------------------------------------

Contents
--------
1. Overview
2. Features
3. Installation
4. Quick Start Guide
5. Acknowledgements
6. Feedback

1. Overview
   --------
   Java client provided to PJM customers to allow uploading and downloading of files
   without having to log into the PJM UI.
   
	
2. Features
   --------
   -> One Executable with example .CMD files for each type of application 
   -> Secured using HTTPS and SSO authentication with PKI
   -> Ability to encrypt password stored locally from prying eyes

3. Installation
   ------------
   
   -> Requirement: Java 8 or higher is required to run the CLI.
   
   -> Simply unzip the contents of pjm-cli.zip somewhere such as C:\tools\ on your PC. 
      The zip file contains all of the code and .CMD files you will need.
	  
	  
4. Quick Start Guide
   ------------

   a. Obtain a valid username and password from PJM for the applications you need to use.
   
   b. Encrypt your password by navigating to directory from Step 3 above and executing
      the command "password MyP@ssw0rd" where  MyP@ssw0rd is the password for your PJM account.
      Output will look like..
	  
	  C:\tools\password.cmd MyP@ssw0rd
	  
	  PJM CLI Password Encryptor 1.5.0
      Copyright 2011-2020, PJM Interconnection LLC.  All rights reserved

      Encrypting password 'MyP@ssw0rd'...
      Encrypted password: ENC(tTQ4TmXkJvHonHooz3Ba2AnjKtku26WX)
	  
   c. Edit the setenv.cmd file in Notepad.  This file is used by all other .cmd files.
   
   d. Change PSWD in setenv.cmd to be the encrypted password from step b.
   
      set PSWD=ENC(tTQ4TmXkJvHonHooz3Ba2AnjKtku26WX)
	  
   e. Change USER in setenv.cmd to be your PJM Account Manager user name.
   
      set USER=mypjmusername

   f. Change JAVA in setenv.cmd to point to a valid Java 8+ Installation such as...
   
      set JAVA=C:\jdk1.8.0_181\jre\bin\java
	  
   g. That is it.  You should now be able to edit and execute any of the .CMD files like idetailer-download.cmd
	  
