*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_create_role_with_numbers_characters
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
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[1]/ul/li[2]/a    50
    Click Element    xpath://*[@id="sidebar-menu"]/ul/li[1]/ul/li[2]/a
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    50
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Sleep    5
    Wait Until Page Contains Element    id:role_name    50
    Input Text    id:role_name    23456
    Wait Until Page Contains Element    xpath://*[@id="role_creation"]/div[1]/div[2]/div/div/button    50
    Click Element    xpath://*[@id="role_creation"]/div[1]/div[2]/div/div/button
    Wait Until Page Contains Element    xpath://*[@id="role_creation"]/div[1]/div[2]/div/div/div/ul/li[1]/a/span[1]    50
    Click Element    xpath://*[@id="role_creation"]/div[1]/div[2]/div/div/div/ul/li[1]/a/span[1]
    Wait Until Page Contains Element    xpath://*[@id="createRoleSave"]    50
    Click Element    xpath://*[@id="createRoleSave"]
    Wait Until Page Contains    Enter valid role.    50
    Close Browser
