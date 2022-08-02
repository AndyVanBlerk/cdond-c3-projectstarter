REM This allows you to delete the workflow by renaming config 
REM STill need to add search and replace in Config.yml....



set /P Decision="What Do you want to do here - Delete or put back original Yaml (RevertDelete) - ANS 1 or 0:  Delete=0 or RevertDelete=1"
echo This is decision  %Decision%!

cd C:\Users\andre\Dropbox\_ANDY\Udacity\__GIT\3.CICD\cdond-c3-projectstarter\.circleci

if %Decision% EQU 0 goto Delete
if %Decision% EQU 1 goto RevertDelete

:Delete
echo You chose to Delete %Decision%
set /P WorkFlowID="What is the workflow ID?"
echo This is workflow ID %WorkFlowID%
powershell -Command "(gc config-deleteEnvironment.yml) -replace 'WorkflowID', '%WorkFlowID%' | Out-File -encoding ASCII config-deleteEnvironment.yml"
ren config.yml  config-Origin.yml
ren config-deleteEnvironment.yml config.yml

echo OK PAUSE TO REVERSE THIS, HIT ENTER TO REVERTDELETE
Pause

powershell -Command "(gc config.yml) -replace '%WorkFlowID%', 'WorkflowID'  | Out-File -encoding ASCII config.yml"
ren config.yml  config-deleteEnvironment.yml
ren config-Origin.yml config.yml 

:RevertDelete
echo You chose to RevertDelete %RevertDelete%
set /P WorkFlowID="What is the workflow ID?"
echo This is workflow ID %WorkFlowID%
powershell -Command "(gc config.yml) -replace '%WorkFlowID%', 'WorkflowID'  | Out-File -encoding ASCII config.yml"
ren config.yml  config-deleteEnvironment.yml
ren config-Origin.yml config.yml 

