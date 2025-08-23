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

Enter Value On Login E-mail Field
    [Arguments]    ${value}
    Type Text    ${INPUT_LOGIN_EMAIL}    ${value}
    Get Text    ${INPUT_LOGIN_EMAIL}    ==    ${value}

Enter Value On Login Password Field
    [Arguments]    ${value}
    Type Text    ${INPUT_LOGIN_PASSWORD}    ${value}
    Get Text    ${INPUT_LOGIN_PASSWORD}    ==    ${value}

Click On Login Submit Button
    Click    ${BTN_SUBMIT_LOGIN}

Check User Name In User Dashboard
    [Arguments]    ${expected_user_name}
    Wait For Elements State    ${CARD_USER_NAME} >> text=${expected_user_name}    visible

Check Toast On Authentication
    [Arguments]    ${title}    ${description}    ${timeout}=15
    Scroll To Element    ${AUTH_LOGIN_TOAST_TITLE}
    Wait For Elements State    ${AUTH_LOGIN_TOAST_TITLE} >> text=${title}    visible    ${timeout}
    Wait For Elements State    ${AUTH_LOGIN_TOAST_DESCRIPTION} >> text=${description}    visible    ${timeout}

Select Registration Form Tab
    [Arguments]    ${tab_name}
    IF    "${tab_name}" == "Recuperar"
        Click    ${TABS_TRIGGER_AUTH_RESET} >> text=${tab_name}
    ELSE IF    "${tab_name}" == "Cadastro"
        Click    ${TABS_TRIGGER_AUTH_REGISTER} >> text=${tab_name}
    ELSE IF    "${tab_name}" == "Login"
        Click    ${TABS_TRIGGER_AUTH_LOGIN} >> text=${tab_name}
    END

Enter Value On Input For Register User Name
    [Arguments]    ${user_name}
    Type Text    ${INPUT_REGISTER_NAME}    ${user_name}

Enter Value On Input For Register User Email
    [Arguments]    ${user_email}
    Type Text    ${INPUT_REGISTER_EMAIL}    ${user_email}

Enter Value On Input For Register User Password
    [Arguments]    ${user_password}
    Type Text    ${INPUT_REGISTER_PASSWORD}    ${user_password}

Enter Value On Input For Confirme Password
    [Arguments]    ${confirm_password}
    Type Text    ${INPUT_CONFIRM_PASSWORD}    ${confirm_password}

Click On Register Button
    Click    ${BTN_SUBMIT_REGISTER}

Input E-mail For Password Recovery
    [Arguments]    ${user_email}
    Type Text    ${INPUT_PASSWORD_RECOVERY_EMAIL}    ${user_email}

Submit Password Recovery Request
    Click    ${BTN_SUBMIT_RESET_PASSWORD}
