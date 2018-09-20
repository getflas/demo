*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_forgot_password
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://111.93.7.182    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    xpath=//input[@id='emailid']    50
    Wait Until Page Contains Element    xpath=//input[@id='pwd']    50
    Wait Until Page Contains Element    xpath:/html/body/div[3]/div/div[2]/form/div[5]/div/a    50
    Click Element    xpath:/html/body/div[3]/div/div[2]/form/div[5]/div/a
    Maximize Browser Window
    Wait Until Page Contains    Reset Password    30
    Close Browser
