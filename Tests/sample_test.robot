*** Settings ***

Resource  ../Resources/Common.robot

Test Setup  Common.Open test browser
Test Teardown  Common.Close test browser
 
*** Variables ***

*** Test Cases ***

Example of connecting to Lambdatest via Robot Framework 
	[Timeout]   ${TIMEOUT}
	Sleep    10s
    Execute JavaScript    smartui.takeScreenshot=Ritam12
	Execute JavaScript    smartui.takeFullPageScreenshot=Ritam9 #only works in case of chrome and above selenium 4.0.0
