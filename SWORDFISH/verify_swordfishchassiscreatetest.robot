*** Settings ***
Documentation     SwordFish Chassis API CURD operations Validation Test Suite
Suite Teardown    DeleteSetup
Library           SWORDFISH.py    WITH NAME    SwordFish
Library           Collections
Variables         config.yaml

*** Variables ***
@{packages}       Collections

*** Test Cases ***
verify_swordfishchassiscreatetest
    [Documentation]    Swordfish API Testing -
    ...    Create New Chassis by given by giving all the required parameters through API validation
    SwordFish.Connect    ${Connection}
    ${c_output}    SwordFish.Create Chassis    @odata.context=${chassis.context}    @odata.id=${chassis.odataid}    @odata.type=${chassis.odatatype}    Id=${chassis.Id}    Name=${chassis.Name}
    ...    ChassisType=${chassis.ChassisType}    Manufacturer=${chassis.Manufacturer}    Model=${chassis.Model}    SKU=${chassis.SKU}    SerialNumber=${chassis.SerialNumber}    Version=${chassis.Version}
    ...    PartNumber=${chassis.PartNumber}    AssetTag=${chassis.AssetTag}
    ${status}    Get From Dictionary    ${c_output}    json_resp
    Run Keyword If    ${status} == 500    FAIL    Chassis Creation Failed !!!
    ...    ELSE    Log    Chassis Creation is \ succesfully!!!
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    log    ${myval}
    Run Keyword If    ${myval} == 404    FAIL    Create Chassis Validation - FAILED !!!
    ...    ELSE    Log    Create Chassis Validation - PASSED !!!

*** Keywords ***
DeleteSetup
    SwordFish.Connect    ${Connection}
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    ${d_output}    Run Keyword If    ${myval} == 404    log    Chassis is already deleted !!!
    ...    ELSE    SwordFish.Delete Chassis    ${chassis.Id}
