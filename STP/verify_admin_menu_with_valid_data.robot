*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_admin_menu_with_valid_data
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
    Wait Until Page Contains    Users    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive_length"]/label/select    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive_filter"]/label/input    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[1]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[2]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[3]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[4]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[5]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[5]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[6]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[7]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[8]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[9]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[10]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[11]/a    50
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[12]/a    50
    Close Browser
