*** Settings ***
Library           Switch.py    WITH NAME    s

*** Variables ***
@{packages}       robotframework-selenium2library

*** Test Cases ***
verify_config_create_add_delete
    s.Connect    192.168.50.21    root    ingenit123
    Sleep    2
    s.Zone Create    test_cfg_zone_1    10:00:00:00:c9:83:63:7d
    Sleep    2
    s.Save Config
    s.Zone Create    test_cfg_zone_2    10:00:00:00:c9:83:63:5d
    Sleep    2
    s.Save Config
    ${i}=    s.Config Create    test_cfg_1    test_cfg_zone_1
    Should Be Equal As Strings    ${i}    configuration created successfully.
    s.Save Config
    ${j}=    s.Add Config    test_cfg_1    test_cfg_zone_2
    Should Be Equal As Strings    ${j}    configuration added successfully.    ${i}
    s.Save Config
    Sleep    2
    ${l}=    s.Cfg Delete    test_cfg_1
    Should Be Equal As Strings    ${l}    cfg deleted sucessfully
    s.Save Config
    Sleep    2
    s.Delete Zone    test_cfg_zone_1
    s.Save Config
    s.Delete Zone    test_cfg_zone_2
    s.Save Config
    s.Disconnect
