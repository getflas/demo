*** Settings ***
Library           Selenium2Library

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_page_numbers_in_the_account_page
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://111.93.7.182    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    id=emailid    50
    Input Text    id=emailid    veera@gm.com
    Wait Until Page Contains Element    id:pwd    50
    Input Text    id:pwd    mypassword
    Wait Until Page Contains Element    xpath://text()[.='Log In']/ancestor::button[1]    50
    Click Element    xpath://text()[.='Log In']/ancestor::button[1]
    Wait Until Page Contains Element    xpath://span[contains(text(),'Accounts')]    50
    Click Element    xpath://span[contains(text(),'Accounts')]
    Wait Until Page Contains Element    //*[@id="datatable-responsive_filter"]/label/input    50
    Click Element    //*[@id="datatable-responsive_filter"]/label/input
    Wait Until Page Contains    Showing 11 to 20    50
    Close Browser
