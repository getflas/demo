*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_create_account
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
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    50
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    sleep    5
    Wait Until Page Contains Element    xpath://*[@id="basic-form-add-res-t-0"]    50
    Wait Until Page Contains Element    xpath://*[@id="company_account_name"]    50
    Wait Until Page Contains Element    xpath://*[@id="company_account_contact_person"]    50
    Close Browser
