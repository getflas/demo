*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_user_page_labels
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
    Comment    Click Element    xpath://*[@id="wrapper"]/div[3]/div/div/div[1]/div/div/a
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[1]    30
    Comment    Input Text    xpath://*[@id="firstname"]    testing
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[2]    30
    Comment    Input Text    id:lastname    fifteen
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[3]    30
    Comment    Input Text    id:email    35testing35@gm.com
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[4]    30
    Comment    Input Text    id:empno    3535
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[5]    30
    Comment    Click Element    id:roleId
    Comment    Wait Until Element Is Visible    xpath://*[@id="roleId"]/option[10]    30
    Comment    Click Element    xpath://*[@id="roleId"]/option[10]
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[6]    30
    Comment    Click Element    id:reportingId
    Comment    Wait Until Page Contains Element    xpath://*[@id="reportingId"]/option[12]    30
    Comment    Click Element    xpath://*[@id="reportingId"]/option[12]
    Wait Until Element Is Visible    xpath://*[@id="datatable-responsive"]/thead/tr/th[7]    30
    Comment    Input Text    id:location    hyderabad
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[8]    30
    Comment    Click Element    id:createuser
    Comment    Wait Until Page Contains    User Created Succesfully    50
    Close Browser
