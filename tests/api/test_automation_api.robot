*** Settings ***

Resource    ${EXECDIR}/resources/keywords/API/test_automation.keywords.resource

Test Tags    API
Test Setup    Create Session    api_session    ${BASE_URL}    ${HEADERS}    disable_warnings=False

*** Test Cases ***

Return All Users With API Session
    [Tags]    Users    smoke

    ${response}=    GET On Session
    ...    alias=api_session
    ...    url=users
    ...    expected_status=200

    Log List    ${response.json()}
    Validate Response Base Informations    ${response}    users    200    OK
    Validate Common Response Headers    ${response.headers}
    Validate If Response Is Not Empty    ${response}
    Validate User Object List    ${response.json()}
    Validate Response Time    ${response}    1500
    Validate User Json Schema    ${response.json()}
