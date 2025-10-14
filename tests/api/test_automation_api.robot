*** Settings ***

Resource    ${EXECDIR}/resources/keywords/API/test_automation.keywords.resource

Test Tags    API
Test Setup    Create Session    ${API_ALIAS}    ${BASE_URL}    ${HEADERS}    disable_warnings=False

*** Test Cases ***

Return All Users With API Session
    [Tags]    Users

    ${response}=    GET On Session
    ...    alias=${API_ALIAS}
    ...    url=users
    ...    expected_status=200

    Validate Response Base Informations    ${response}    users    200    OK
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate User Object List    ${response.json()}
    Validate Response Time    ${response}    1500
    Validate Return All Users Json Schema    ${response.json()}

Should Be Possible Create a New User
    [Tags]    CreateUser
    ${user}=    Create Fake User Data

    Validate Create User Request Json Schema    ${user}

    ${body}=    Convert JSON To String    ${user}

    ${response}=    POST On Session    ${API_ALIAS}    /users    ${body}
    Log Many    ${response.json()}

    Validate Response Base Informations    ${response}    users    201    Created
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate User Object    ${response.json()}
    Validate Response Time    ${response}    1500
    Validate Create User Response Json Schema    ${response.json()}

