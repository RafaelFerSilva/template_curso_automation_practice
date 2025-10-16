*** Settings ***
Library             DatabaseLibrary
Resource            ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Set Database data
    ${database_data}=    Create Dictionary
    ...    DB_NAME=%{DB_NAME}
    ...    DB_USER=%{DB_USER}
    ...    DB_PASSWORD=%{DB_PASSWORD}
    ...    DB_HOST=%{DB_HOST}
    ...    DB_PORT=%{DB_PORT}
    ...    DB_API_MODULE_NAME=${DB_API_MODULE_NAME}
    Log Many    ${database_data}
    Set Global Variable    ${DATABASE}    ${database_data}

Connect to application database
    [Setup]    Set Database data

    Connect To Database
    ...    db_module=${DATABASE}[DB_API_MODULE_NAME]
    ...    db_name=${DATABASE}[DB_NAME]
    ...    db_user=${DATABASE}[DB_USER]
    ...    db_password=${DATABASE}[DB_PASSWORD]
    ...    db_host=${DATABASE}[DB_HOST]
    ...    db_port=${DATABASE}[DB_PORT]

