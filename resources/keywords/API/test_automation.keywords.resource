*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    String
Library    FakerLibrary

*** Variables ***

# String
${BASE_URL}=    https://test-automation-practice.com.br/api


${API_ALIAS}=    api_session

# Dictionay
&{HEADERS}=    Content-Type=application/json    Accept=application/json

# List
@{EXPECTED_USERS_KEYS}=    id    name    email    age    city    department    active    created    salary


*** Keywords ***

Validate Response Base Informations
    [Arguments]    ${response}    ${api_resouce}=users   ${status_code}=200    ${reason}=OK

    Should Be Equal As Strings     ${response.url}           ${BASE_URL}/${api_resouce}
    Should Be Equal As Integers    ${response.status_code}    ${status_code}
    Should Be Equal As Strings     ${response.reason}         ${reason}

Validate Common Response Headers
    [Arguments]    ${headers}

    Dictionary Should Contain Key    ${headers}    Content-Type
    Should Contain    ${headers['Content-Type']}    application/json

Validate If Response Is Not Empty
    [Arguments]    ${response}

    Should Not Be Empty            ${response.json()}
    ${itens}=    Set Variable    ${response.json()}
    ${len}=    Get Length    ${itens}
    Should Be True    ${len} > 0

Validate User Object
    [Arguments]    ${user}    ${expected_keys}=${EXPECTED_USERS_KEYS}

    # Validar se todos os campos obrigatórios estão presentes
    FOR    ${key}    IN    @{expected_keys}
        Dictionary Should Contain Key    ${user}    ${key}
    END

    # Valida tipos
    Should Be String    isinstance(${user['id']}, (int, long))    msg=User ID should be an integer
    Should Be String    isinstance(${user['active']}, (boolean))    msg=User active should be an bollean
    Should Be String    isinstance(${user['age']}, (int, long))    msg=User age should be an integer
    Should Be String    isinstance(${user['salary']}, (number))    msg=User salary should be an integer
    Should Be String    ${user['name']}
    Should Be String    ${user['email']}
    Should Be String    ${user['city']}
    Should Be String    ${user['department']}
    Should Be String    ${user['created']}

    # Validar formato do email
    Should Match Regexp    ${user['email']}    ^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$

    # Garante que não há campos sensíveis
    Should Not Contain    ${user.keys()}    password
    Should Not Contain    ${user.keys()}    token

Validate User Object List
    [Arguments]    ${users}
    # Validação de cada usuário (Observar a quantidade de users em casos reais)
    FOR    ${user}    IN    @{users}
        Validate User Object    ${user}    ${EXPECTED_USERS_KEYS}
    END

Validate Response Time
    [Arguments]    ${response}    ${limit_time}=1500

    ${elapsed_ms}=    Evaluate    ${response.elapsed.total_seconds()} * 1000
    Should Be True    ${elapsed_ms} < ${limit_time}

Validate Return All Users Json Schema
    [Arguments]    ${response_json}

    Validate Json By Schema File
    ...    json_object=${response_json}
    ...    path_to_schema=${EXECDIR}/resources/files/json_schemas/users.json

Create Fake User Data
    ${name}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${age}=    FakerLibrary.RandomInt    18    99
    ${city}=    FakerLibrary.City
    ${user}=    Create Dictionary    name=${name}    email=${email}    age=${age}    city=${city}
    RETURN    ${user}

Validate Create User Request Json Schema
    [Arguments]    ${body}
     Validate Json By Schema File
     ...    json_object=${body}
     ...    path_to_schema=${EXECDIR}/resources/files/json_schemas/create_user_request.json

Validate Create User Response Json Schema
    [Arguments]    ${response}
    Validate Json By Schema File
    ...    json_object=${response}
    ...    path_to_schema=${EXECDIR}/resources/files/json_schemas/create_user_response.json

Get Registered User
    [Arguments]    ${user_id}    ${alias}=${API_ALIAS}   ${expected_status}=200
    ${user}=    GET On Session     alias=${alias}   url=/users/${user_id}    expected_status=${expected_status}
    RETURN    ${user}