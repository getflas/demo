*** Settings ***
Library           Selenium2Library    WITH NAME    se

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_accounts_page_labels
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
    Wait Until Page Contains Element    xpath://*[@id="sidebar-menu"]/ul/li[2]/a/span[1]    50
    Click Element    xpath://*[@id="sidebar-menu"]/ul/li[2]/a/span[1]
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[1]    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[2]    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[3]    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[4]    50
    Wait Until Page Contains Element    xpath://*[@id="datatable-responsive"]/thead/tr/th[5]    50
    Close Browser
