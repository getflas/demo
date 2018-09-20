*** Settings ***
Library           Switch.py    WITH NAME    s

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_zone_create_add_remove_delete
    s.Connect    192.168.50.21    root    ingenit123
    Sleep    3
    ${a}=    s.Zone Create    test_zone_1    10:00:00:00:c9:83:63:7d
    Should Be Equal As Strings    ${a}    zone created successfully.
    s.Save Config
    ${b}=    s.Zone Add    test_zone_1    10:00:00:00:c9:83:63:8d
    Should Be Equal As Strings    ${b}    zone added successfully.
    s.Save Config
    Sleep    2
    ${c}=    s.Remove Zone    test_zone_1    10:00:00:00:c9:83:63:7d
    Should Be Equal As Strings    ${c}    alia removed from zone successfully.
    s.Save Config
    Sleep    3
    ${d}=    s.Delete Zone    test_zone_1
    Should Be Equal As Strings    ${d}    zone deleted successfully.
    s.Save Config
    s.Disconnect
