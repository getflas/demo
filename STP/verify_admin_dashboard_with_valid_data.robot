*** Settings ***
Library           Selenium2Library    WITH NAME    se
Library           Collections

*** Variables ***
@{packages}       robotframework-selenium2library    Collections
@{stp_server}     os=ubuntu    version=14.04    ip=

*** Test Cases ***
verify_login_with_valid_data
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    disable-extension
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    http://${stp_server.ip}    Chrome    desired_capabilities=${options}
    Wait Until Page Contains Element    xpath=//input[@id='emailid']    50
    Input Text    xpath=//input[@id='emailid']    test
    Wait Until Page Contains Element    xpath=//input[@id='pwd']    50
    Input Text    xpath=//input[@id='pwd']    test
    Close Browser
