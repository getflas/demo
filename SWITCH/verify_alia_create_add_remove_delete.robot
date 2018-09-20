*** Settings ***
Library           Switch.py    WITH NAME    s

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_alia_create_add_remove_delete
    s.Connect    192.168.50.21    root    ingenit123
    Sleep    2
    ${e}=    s.Ali Create    test_ali_1    10:00:00:00:c9:83:63:1d
    Sleep    2
    Should Be Equal As Strings    ${e}    ali created successfully.
    s.Save Config
    ${f}=    s.Ali Add    test_ali_1    10:00:00:00:c9:83:63:1a
    Sleep    2
    Should Be Equal As Strings    ${f}    ali added successfully.
    s.Save Config
    Sleep    2
    ${g}=    s.Ali Remove    test_ali_1    10:00:00:00:c9:83:63:1d
    Should Be Equal As Strings    ${g}    ali removed successfully
    s.Save Config
    Sleep    2
    ${h}=    s.Ali Delete    test_ali_1
    Sleep    2
    Should Be Equal As Strings    ${h}    ali deleted sucessfully
    s.Save Config
    Sleep    2
    s.Disconnect
