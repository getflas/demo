*** Settings ***
Documentation     SwordFish Chassis API CURD operations Validation Test Suite
Suite Teardown    DeleteSetup
Library           SWORDFISH.py    WITH NAME    SwordFish
Library           Collections
Variables         config.yaml

*** Variables ***
@{packages}       Collections

*** Test Cases ***
verify_swordfishchassisupdatetest
    [Documentation]    Swordfish API Testing -
    ...    Update Chassis Data of a given Chassis-ID API validation
    SwordFish.Connect    ${Connection}
    ${c_output}    SwordFish.Create Chassis    @odata.context=${chassis.context}    @odata.id=${chassis.odataid}    @odata.type=${chassis.odatatype}    Id=${chassis.Id}    Name=${chassis.Name}
    ...    ChassisType=${chassis.ChassisType}    Manufacturer=${chassis.Manufacturer}    Model=${chassis.Model}    SKU=${chassis.SKU}    SerialNumber=${chassis.SerialNumber}    Version=${chassis.Version}
    ...    PartNumber=${chassis.PartNumber}    AssetTag=${chassis.AssetTag}
    ${u_output}    SwordFish.Update Chassis    ${chassis.Id}    Status=${chassis.Status}    Power=${chassis.Power}    Thermal=${chassis.Thermal}
    ${status}    Get From Dictionary    ${u_output}    json_resp
    Run Keyword If    ${status} == 500    FAIL    Chassis Data Updation Failed !!!
    ...    ELSE    Log    Chassis Data is updated succesfully!!!
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    ${keys}    Get Dictionary Keys    ${myval}
    ${updated_keys}    Create List    Status    Power    Thermal
    ${abc}    List Should Contain Sub List    ${keys}    ${updated_keys}    msg=Chassis Updation Validation Failed, Updated Keys data is not there in the Chassis data !!!    values=False
    Run Keyword If    ${abc} is None    Log    Update Chassis Details Validation - PASSED !!!

*** Keywords ***
DeleteSetup
    SwordFish.Connect    ${Connection}
    ${output}    SwordFish.Get Chassis    ${chassis.Id}
    ${myval}    Get From Dictionary    ${output}    json_resp
    ${d_output}    Run Keyword If    ${myval} == 404    log    Chassis is already deleted !!!
    ...    ELSE    SwordFish.Delete Chassis    ${chassis.Id}
