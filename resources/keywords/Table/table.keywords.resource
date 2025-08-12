*** Settings ***
Resource    table.page.resource


*** Keywords ***
Table Should Contain User
    [Arguments]    ${email}    ${name}    ${age}    ${department}    ${salary}    ${status}=Ativo    ${state}=visible

    Table Should Contain User Data    ${email}    name    ${name}
    Table Should Contain User Data    ${email}    age    ${age}
    Table Should Contain User Data    ${email}    department    ${department}
    Table Should Contain User Data    ${email}    salary    ${salary}
    Table Should Contain User Data    ${email}    name    ${name}
    Check User Status    ${email}    ${status}    ${state}

Select Department Dropdown Item
    [Arguments]    ${item}

    Click On Department Dropdown
    Select Department Dropdown    ${item}

Select Status Dropdown Item
    [Arguments]    ${status}

    Click On Status Dropdown
    Select Status Dropdown    ${status}
