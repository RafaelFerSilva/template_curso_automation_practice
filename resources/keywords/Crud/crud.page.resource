*** Settings ***
Library     Browser
Resource    crud.variables.resource


*** Keywords ***
Click On Button To Create Product
    Click    ${CREATE_PROD_BUTTON}

Input Value On Create Product Form Field
    [Arguments]    ${field_key}    ${value}
    Wait For Elements State    ${CREATE_PROD_FIELDS}[${field_key}]    visible
    Type Text    ${CREATE_PROD_FIELDS}[${field_key}]    ${value}

Select Product Availability
    [Arguments]    ${availability}=checked
    ${actual_state}=    Get Attribute    ${CREATE_PROD_AVAILABLE_BUTTON}    data-state
    IF    '${actual_state}' != '${availability}'
        Click    ${CREATE_PROD_AVAILABLE_BUTTON}
        ${actual_state}=    Get Attribute    ${CREATE_PROD_AVAILABLE_BUTTON}    data-state
        Should Be Equal As Strings    ${actual_state}    ${availability}
    END

Close Create Product Form
    Click    ${CREATE_PROD_CANCEL_BUTTON}

Click On Button To Salve Product
    Click    ${CREATE_PROD_SALVE_BUTTON}
