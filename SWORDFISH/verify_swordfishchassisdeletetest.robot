*** Settings ***
Documentation     SwordFish Chassis API CURD operations Validation Test Suite
Suite Teardown    DeleteSetup
Library           SWORDFISH.py    WITH NAME    SwordFish
Library           Collections
Variables         config.yaml

*** Variables ***
@{packages}       Collections

*** Test Cases ***
verify_swordfishchassisdeletetest
    [Documentation]    Swordfish API Testing -
    ...    Delete Chassis Data of a given Chassis-ID API validation
    SwordFish.Connect    ${Connection}
    ${c_output}    SwordFish.Create Chassis    @odata.context=${chassis.context}    @odata.id=${chassis.odataid}    @odata.type=${chassis.odatatype}    Id=${chassis.Id}    Name=${chassis.Name}
    ...    ChassisType=${chassis.ChassisType}    Manufacturer=${chassis.Manufacturer}    Model=${chassis.Model}    SKU=${chassis.SKU}    SerialNumber=${chassis.SerialNumber}    Version=${chassis.Version}
    ...    PartNumber=${chassis.PartNumber}    AssetTag=${chassis.AssetTag}
    ${output}    SwordFish.Delete Chassis    ${chassis.Id}
    Run Keyword If    ${output} == 200    log    Chassis Deleted Succesfully!!!
    ...    ELSE    FAIL    TC Failed, Not able to delete the Chassis
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    log    ${myval}
    Run Keyword If    ${myval} == 404    log    Delete Chassis Verification Passed !!!
    ...    ELSE    FAIL    Delete Chassis Verification Failed !!!

*** Keywords ***
DeleteSetup
    SwordFish.Connect    ${Connection}
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    ${d_output}    Run Keyword If    ${myval} == 404    log    Chassis is already deleted !!!
    ...    ELSE    SwordFish.Delete Chassis    ${chassis.Id}
