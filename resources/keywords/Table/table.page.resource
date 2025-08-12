*** Settings ***
Resource    table.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Table Should Contain User Data
    [Arguments]    ${user_email}    ${cell}    ${cell_value}

    ${row}=    Replace String    ${TABLE_ROW}    $$    ${user_email}

    ${element}=    String Replace    ${row}${TABLE_CELL_ITEM}    $$    ${cell}    ${cell_value}
    Wait For Elements State    ${element}    visible

Check User Status
    [Arguments]    ${user_email}    ${status}=Ativo    ${state}=visible

    ${row}=    Replace String    ${TABLE_ROW}    $$    ${user_email}
    ${element}=    Replace String    ${row}${TABLE_CELL_BADGE_STATUS}    $$    ${status}
    Wait For Elements State    ${element}    ${state}

Validate Table Rows Quantity
    [Arguments]    ${expected_count}

    Get Element Count    ${TABLE_ROWNS_SIZE}    ==    ${expected_count}

Input Value Search Field
    [Arguments]    ${value}
    Type Text    ${FILTER_SEARCH}    ${value}
    Get Text    ${FILTER_SEARCH}    ==    ${value}

Click On Department Dropdown
    Click    ${FILTER_DEPARTMENT}

Select Department Dropdown
    [Arguments]    ${expected_value}
    Click    ${DROPDOWN_SELECT_COUNTENT} >> role=option[name="${expected_value}"]
    Get Text    ${FILTER_DEPARTMENT}    ==    ${expected_value}

Click On Status Dropdown
    Click    ${FILTER_STATUS}

Select Status Dropdown
    [Arguments]    ${expected_value}
    Click    ${DROPDOWN_SELECT_COUNTENT} >> role=option[name="${expected_value}"]
    Get Text    ${FILTER_STATUS}    ==    ${expected_value}
