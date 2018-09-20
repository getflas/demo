*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_the_reporting_by_selecting_multiple_roles
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://111.93.7.182    Chrome    desired_capabilities=${options}
    Input Text    xpath=//input[@id='emailid']    veera@gm.com
    Input Password    xpath=//input[@id='pwd']    mypassword
    Click Button    xpath=//button[@class='btn btn-purple btn-block text-uppercase waves-effect waves-light']
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    30
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Wait Until Element Is Visible    id:reportingId    30
    Click Element    id:reportingId
    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Click Element    xpath://*[@id="reportingId"]/option[12]
    Wait Until Element Is Visible    id:reportingId    30
    Click Element    id:reportingId
    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[11]    30
    Click Element    xpath://*[@id="reportingId"]/option[11]
    Close Browser
