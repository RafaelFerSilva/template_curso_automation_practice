*** Settings ***
Library             DatabaseLibrary
Library             Collections
Library             OperatingSystem
Library             String
Resource            ${EXECDIR}/resources/common.keywords.resource


*** Variables ***
${LOCAL_SQL_FOLDER}=    ${EXECDIR}/resources/sql/


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

Perform a database query
    [Arguments]    ${query}    ${asDict}=${True}

    ${response_query}=    Query    select_statement=${query}    return_dict=${asDict}
    Log Many    ${response_query}
    RETURN    ${response_query}

Return the contents of the sql local query file and perform the query in the database
    [Arguments]    ${sql_file_name}    @{replace_strings}    ${asDict}=True

    ${template}=    Get File    ${LOCAL_SQL_FOLDER}/${sql_file_name}
    ${element}=    String Replace    ${template}    @{replace_strings}
    ${item}=    Perform a database query    ${element}    ${asDict}

    RETURN    ${item}