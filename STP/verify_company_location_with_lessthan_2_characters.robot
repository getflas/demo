*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_company_location_with_lessthan_2_characters
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
    Wait Until Page Contains Element    xpath://text()[.='Create Account']/ancestor::a[1]    50
    Click Element    xpath://text()[.='Create Account']/ancestor::a[1]
    sleep    5
    Wait Until Page Contains Element    id=company_account_name    50
    Input Text    id=company_account_name    Nexiilabs
    Wait Until Page Contains Element    id=company_account_location    50
    Input Text    id=company_account_location    Hy
    Wait Until Page Contains Element    xpath://*[@id="basic-form-add-res"]/div[3]/ul/li[2]/a    50
    Click Element    xpath://*[@id="basic-form-add-res"]/div[3]/ul/li[2]/a
    Wait Until Page Contains    Location has to be more than 3 characters.    50
    Close Browser
