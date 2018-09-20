*** Settings ***
Documentation     SwordFish Chassis API CURD operations Validation Test Suite
Suite Teardown    DeleteSetup
Library           SWORDFISH.py    WITH NAME    SwordFish
Library           Collections
Variables         config.yaml

*** Variables ***
@{packages}       Collections

*** Test Cases ***
verify_swordfishchassisretrivetest
    [Documentation]    Swordfish API Testing -
    ...    Retrive Chassis Data of a given Chassis-ID API validation
    SwordFish.Connect    ${Connection}
    ${c_output}    SwordFish.Create Chassis    @odata.context=${chassis.context}    @odata.id=${chassis.odataid}    @odata.type=${chassis.odatatype}    Id=${chassis.Id}    Name=${chassis.Name}
    ...    ChassisType=${chassis.ChassisType}    Manufacturer=${chassis.Manufacturer}    Model=${chassis.Model}    SKU=${chassis.SKU}    SerialNumber=${chassis.SerialNumber}    Version=${chassis.Version}
    ...    PartNumber=${chassis.PartNumber}    AssetTag=${chassis.AssetTag}
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    log    ${myval}
    ${myId}    Run Keyword If    ${myval} == 404    FAIL    Retrive Chassis Details Test Failed !!!
    ...    ELSE    Get From Dictionary    ${myval}    Id
    ${id1}    Convert to string    ${chassis.Id}
    ${R_Verify}=    Should Be Equal As Strings    ${myId}    ${id1}    msg = Retrive Chassis Details Validation Test Failed !!!    values=False
    Run Keyword If    ${R_Verify} is None    Log    Retrive Chassis Details Validation Test Passed !!!

*** Keywords ***
DeleteSetup
    SwordFish.Connect    ${Connection}
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    ${d_output}    Run Keyword If    ${myval} == 404    log    Chassis is already deleted !!!
    ...    ELSE    SwordFish.Delete Chassis    ${chassis.Id}
