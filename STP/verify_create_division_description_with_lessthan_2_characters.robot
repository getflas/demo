*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_create_division_description_with_lessthan_2_characters
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
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[1]/ul/li[3]/a    50
    Click Element    xpath://*[@id="sidebar-menu"]/ul/li[1]/ul/li[3]/a
    Wait Until Page Contains    Divisions    50
    Wait Until Page Contains Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a    50
    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Sleep    3
    Wait Until Page Contains Element    xpath://*[@id="division_name"]    50
    Input Text    xpath://*[@id="division_name"]    aaaa
    Wait Until Page Contains Element    xpath://*[@id="division_description"]    50
    Input Text    xpath://*[@id="division_description"]    aa
    Wait Until Page Contains Element    xpath://*[@id="createDivisionSave"]    50
    Click Element    xpath://*[@id="createDivisionSave"]
    Wait Until Page Contains    Division Description has to be more than 3 characters.    50
    Close Browser
