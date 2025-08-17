*** Settings ***
Library     Browser
Library     JSONLibrary
Library     Collections
Resource    authentication.variables.resource


*** Keywords ***
Load User Json File
    [Arguments]    ${file_path}=${EXECDIR}/resources/files/users.json

    ${json_data}=    Load JSON From File    ${file_path}
    Log Many    ${json_data}
    RETURN    ${json_data}

Read Json And Return Users By Role
    [Arguments]    ${role}
    ${json_data}=    Load User Json File
    ${users}=    Get From Dictionary    ${json_data}    users
    ${users_by_role}=    Create List
    FOR    ${user}    IN    @{users}
        IF    '${user}[role]' == '${role}'
            Append To List    ${users_by_role}    ${user}
        END
    END

    Log Many    ${users_by_role}
    RETURN    ${users_by_role}

Read Json And Return User By E-mail
    [Arguments]    ${email}
    ${json_data}=    Load User Json File
    ${users}=    Get From Dictionary    ${json_data}    users
    FOR    ${user}    IN    @{users}
        IF    '${user}[email]' == '${email}'    RETURN    ${user}
    END
    RETURN    None

