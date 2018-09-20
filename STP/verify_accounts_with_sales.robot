*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_accounts_with_sales
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://111.93.7.182    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    id=emailid    50
    Input Text    id=emailid    sal1@gm.com
    Wait Until Page Contains Element    id:pwd    50
    Input Text    id:pwd    mypassword
    Wait Until Page Contains Element    xpath://text()[.='Log In']/ancestor::button[1]    50
    Click Element    xpath://text()[.='Log In']/ancestor::button[1]
    Wait Until Page Contains    Accounts    50
    Close Browser
