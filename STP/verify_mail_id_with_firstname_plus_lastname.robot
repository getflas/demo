*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_mail_id_with_firstname_plus_lastname
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
    Wait Until Element Is Visible    xpath://*[@id="firstname"]    30
    Input Text    xpath://*[@id="firstname"]    abc
    Wait Until Element Is Visible    id:lastname    30
    Input Text    id:lastname    def
    Wait Until Element Is Visible    id:email    30
    Input Text    id:email    abc+def@gm.com
    Comment    Wait Until Element Is Visible    id:empno    30
    Comment    Input Text    id:empno    3535
    Comment    Wait Until Element Is Visible    id:roleId    30
    Comment    Click Element    id:roleId
    Comment    Wait Until Element Is Visible    xpath://*[@id="roleId"]/option[10]    30
    Comment    Click Element    xpath://*[@id="roleId"]/option[10]
    Comment    Wait Until Element Is Visible    id:reportingId    30
    Comment    Click Element    id:reportingId
    Comment    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Comment    Click Element    xpath://*[@id="reportingId"]/option[12]
    Comment    Wait Until Element Is Visible    id:location    30
    Comment    Input Text    id:location    hyderabad
    Wait Until Page Contains Element    id:createuser    30
    Click Element    id:createuser
    Wait Until Page Contains    Enter valid email.    50
    Close Browser
