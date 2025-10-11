*** Settings ***
Library     Browser
Library     JSONLibrary
Library     Collections
Library     FakerLibrary
Resource    crud.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


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

Select Category
    [Arguments]    ${category_value}
    Click    ${CREATE_PROD_FIELDS}[CATEGORY]
    Select Options By    ${CATEGORY_SELECT}    value    ${category_value}
    Keyboard Key    press    Escape

Select Rating
    [Arguments]    ${rating_value}
    Click    ${CREATE_PROD_FIELDS}[RATING]
    Select Options By    ${RATING_SELECT}    value    ${rating_value}
    Keyboard Key    press    Escape

Check Table Row Value
    [Documentation]    Verifies if the table row contains the expected product name and row value. Not use for product status
    [Arguments]    ${product_name}    ${row_id}    ${row_value}    ${state}=visible

    ${element}=    String Replace    ${TABLE_TD_VALUES}    ${product_name}    ${row_id}    ${row_value}
    Wait For Elements State    ${element}    ${state}

Check Table Row Status
    [Documentation]    Verifies if the table row contains the expected product status.
    [Arguments]    ${product_name}    ${row_status}

    ${element}=    String Replace    ${TABLE_ITEM_STATUS}    ${product_name}    Disponível

    IF    '${row_status}' == 'unchecked'
        ${element}=    String Replace    ${TABLE_ITEM_STATUS}    ${product_name}    Indisponível
    END

    Wait For Elements State    ${element}    visible

Click On Table Row Button
    [Arguments]    ${product_name}    ${button_id}

    ${element}=    String Replace    ${TABLE_ITEM_BUTTONS}    ${product_name}    ${button_id}
    Click    ${element}

Load Product Json File
    [Arguments]    ${file_path}=${EXECDIR}/resources/files/products.json

    ${json_data}=    Load JSON From File    ${file_path}
    Log Many    ${json_data}
    RETURN    ${json_data}

Read Json And Return Random product
    ${json_data}=    Load Product Json File
    ${len}=    Get Length    ${json_data}[products]
    ${randon_index}=    FakerLibrary.Random Number    0    ${len - 1}
    RETURN    ${json_data}[products][${randon_index}]

Input Value On Update Product Form Field
    [Arguments]    ${field_key}    ${value}
    Wait For Elements State    ${UPDATE_PROD_FIELDS}[${field_key}]    visible
    Type Text    ${UPDATE_PROD_FIELDS}[${field_key}]    ${value}

Update Product Availability
    [Arguments]    ${availability}=checked
    ${actual_state}=    Get Attribute    ${UPDATE_PROD_AVAILABLE_BUTTON}    data-state
    IF    '${actual_state}' != '${availability}'
        Click    ${UPDATE_PROD_AVAILABLE_BUTTON}
        ${actual_state}=    Get Attribute    ${UPDATE_PROD_AVAILABLE_BUTTON}    data-state
        Should Be Equal As Strings    ${actual_state}    ${availability}
    END

Close Update Product Form
    Click    ${CREATE_PROD_CANCEL_BUTTON}

Click On Button To Save Updated Product
    Click    ${UPDATE_PROD_SALVE_BUTTON}

Update Category
    [Arguments]    ${category_value}
    Click    ${UPDATE_PROD_FIELDS}[CATEGORY]
    Select Options By    ${CATEGORY_SELECT}    value    ${category_value}
    Keyboard Key    press    Escape

Update Rating
    [Arguments]    ${rating_value}
    Click    ${UPDATE_PROD_FIELDS}[RATING]
    Select Options By    ${RATING_SELECT}    value    ${rating_value}
    Keyboard Key    press    Escape
