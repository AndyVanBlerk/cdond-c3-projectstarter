REM This makes a copy of config.yml
REM Then it renames it to the input value given



set /P Version="WhatVersionShould this be backed up to"
echo This is the version %Version%!
copy "C:\Users\andre\Dropbox\_ANDY\Udacity\__GIT\3.CICD\cdond-c3-projectstarter\.circleci\config.yml"  "C:\Users\andre\Dropbox\_ANDY\Udacity\__GIT\3.CICD\cdond-c3-projectstarter\.circleci\_BACKUP\config%Version%.yml"