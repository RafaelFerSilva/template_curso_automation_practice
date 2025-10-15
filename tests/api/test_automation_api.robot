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
    Validate Response Base Informations    ${response}    users    201    Created
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate User Object    ${response.json()}
    Validate Response Time    ${response}    1500
    Validate Create User Response Json Schema    ${response.json()}

Should Be Possible Update A User
    [Tags]    UpdateUser

    ${user}=    Get Registered User    1

    ${city}=    FakerLibrary.City
    ${data}=    Create Dictionary  city=${city}
    ${body}=    Convert JSON To String    ${data}
    ${response}=    PUT On Session    ${API_ALIAS}    /users/${user}[id]   ${body}

    Validate Response Base Informations    ${response}    users/${user}[id]    200    OK
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate User Object    ${response.json()}
    Validate Response Time    ${response}    1500

    ${expected_user}=    Copy Dictionary    ${user}    deepcopy=True
    ${expected_user}=    Set To Dictionary    ${expected_user}    city=${city}

    Dictionaries Should Be Equal    ${response.json()}    ${expected_user}
    Validate Create User Request Json Schema    ${user}

Should Be Possible Delete A User
    [Tags]    DeleteUser

    ${response}=    Delete On Session    ${API_ALIAS}    /users/1    200    OK
    Validate Response Base Informations    ${response}    users/1    200    OK
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate Response Time    ${response}    1500

    Should Be Equal As Strings    ${response.json()}[message]    User deleted successfully

