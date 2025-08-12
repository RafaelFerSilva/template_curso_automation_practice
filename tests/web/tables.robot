*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Table/table.keywords.resource

Test Setup      Run Keywords
...                 Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    TABLES

Test Tags       web    tables    tables_web


*** Test Cases ***
Check Default User Table Users
    Table Should Contain User    joao@email.com    João Silva    28    TI    5,000
    Table Should Contain User    maria@email.com    Maria Santos    32    RH    4,500
    Table Should Contain User    carlos@email.com    Carlos Oliveira    45    Financeiro    6,000    Inativo
    Table Should Contain User    ana@email.com    Ana Costa    29    Marketing    4,800
    Table Should Contain User    pedro@email.com    Pedro Lima    35    Vendas    5,200
    Validate Table Rows Quantity    5

Filter Table By User Name
    [Tags]    filter    user
    Input Value Search Field    Maria Santos
    Table Should Contain User    maria@email.com    Maria Santos    32    RH    4,500
    Validate Table Rows Quantity    1

Filter Table By User E-mail
    [Tags]    filter    email
    Input Value Search Field    ana@email.com
    Table Should Contain User    ana@email.com    Ana Costa    29    Marketing    4,800
    Validate Table Rows Quantity    1

Filter Table By Department
    [Tags]    filter    department
    Select Department Dropdown Item    RH
    Table Should Contain User    maria@email.com    Maria Santos    32    RH    4,500
    Validate Table Rows Quantity    1

    Select Department Dropdown Item    TI
    Table Should Contain User    joao@email.com    João Silva    28    TI    5,000
    Validate Table Rows Quantity    1

Filter Table By Status
    [Tags]    status

    Select Status Dropdown Item    Inativo
    Table Should Contain User    carlos@email.com    Carlos Oliveira    45    Financeiro    6,000    Inativo
    Validate Table Rows Quantity    1

    Select Status Dropdown Item    Ativo
    Table Should Contain User    joao@email.com    João Silva    28    TI    5,000
    Table Should Contain User    maria@email.com    Maria Santos    32    RH    4,500
    Table Should Contain User    ana@email.com    Ana Costa    29    Marketing    4,800
    Table Should Contain User    pedro@email.com    Pedro Lima    35    Vendas    5,200
    Validate Table Rows Quantity    4
