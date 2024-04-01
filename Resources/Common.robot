*** Settings ***
Library  SeleniumLibrary
Library  LambdaTestStatus.py

*** Variables ***
${BROWSER}          ${ROBOT_BROWSER}
&{lt_options}       browserName=${browserName}      name=RobotFramework Lambda Test    buildName=Robot Build    smartUI.project=RobotFramework#pullpage3    project=Untitled#4    selenium_version=4.12.0
${REMOTE_URL}       http://username:acesskey@hub.lambdatest.com/wd/hub
${TIMEOUT}          30000

*** Keywords ***
Open test browser
    [Timeout]   ${TIMEOUT}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${BROWSER}Options()    sys, selenium.webdriver
    Call Method    ${options}    set_capability    LT:Options    ${lt_options}
    Open Browser    https://www.lambdatest.com/support/docs/selenium-visual-regression/
    ...    browser=${BROWSER}
    ...    remote_url=${REMOTE_URL}
    ...    options=${options}

Close test browser
    Run keyword if    '${REMOTE_URL}' != ''
    ...    Report Lambdatest Status
    ...    ${TEST_NAME}
    ...    ${TEST_STATUS}
    Close All Browsers
