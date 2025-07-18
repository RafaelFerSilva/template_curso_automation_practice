*** Settings ***
Documentation       This is test suite for home page

Resource            ${EXECDIR}/resources/common.keywords.resource
Resource            ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource            ${EXECDIR}/resources/keywords/Navigation/navigation.keywords.resource

Suite Setup         Open The Test Automation Practice Site    is_mobile=True

Test Tags           home    navigation    mobile


*** Test Cases ***
Should Be Possible To Navigate To Pages By Home Page Card
    [Tags]    smoke
    Click on each of the cards on the home page and validate the title of the redirected page

Should Be Possible To Navigate to Pages By Menu
    [Tags]    smoke
    Click On Each Of The Mobile Menu Items And Validate Navigation
