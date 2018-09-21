*** Settings ***
Library           Winio.py    WITH NAME    s
Library           Switch.py    WITH NAME    j
Library           VNX.py    WITH NAME    p

*** Test Cases ***
verify_start_io_and_io_status
    s.Connect    192.168.50.70    Administrator    Nexii@123
    ${hostwwn}    s.Getwwn
    j.Connect    192.168.50.21    root    ingenit123
    ${zone_name}    Set Variable    test_zone_host_4
    j.Zone Create    ${zone_name}    ${hostwwn}
    j.Save Config
    j.Zone Add    ${zone_name}    50:06:01:61:08:60:78:21
    j.Add Config    config_vnx_1    ${zone_name}
    j.Save Config
    j.Enable Config    config_vnx_1
    p.Connect    sysadmin    sysadmin
    ${sg_name}    Set Variable    FLAS_SG_12
    ${sg_status}    Run Keyword And Return Status    p.Create Sg    192.168.50.51    ${sg_name}
    run keyword if    ${sg_status}    log    Storage group creation successful
    ...    ELSE    FAIl    storage group creation failed
    p.Connect Host Sg    192.168.50.51    esxi-17    ${sg_name}
    ${lun_number}    Set Variable    70
    p.Create Lun Pool    192.168.50.51    thin    1    10    ${lun_number}
    Sleep    30
    ${hlu_number}    Set Variable    17
    p.Lun Map Sg    192.168.50.51    ${sg_name}    ${hlu_number}    ${lun_number}
    Run Keyword    Config_IO
    Sleep    60
    p.Lun Unmap Sg    192.168.50.51    ${sg_name}    ${hlu_number}    ${lun_number}

*** Keywords ***
Config_IO
    s.Connect    192.168.50.70    Administrator    Nexii@123
    ${x}=    s.Getinitiator
    @{block_size}    create list    4K    8K
    @{read_pct}    create list    10    20
    @{seq_pct}    create list    50    20
    s.Startio    ${block_size}    2    ${read_pct}    ${seq_pct}    pr_type=fc
    sleep    30
    Comment    s.Connect    192.168.50.70    Administrator    Nexii@123
    s.Io Status
