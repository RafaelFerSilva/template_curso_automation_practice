*** Settings ***
Library     Browser
Library     Collections
Resource    ${EXECDIR}/resources/keywords/Home/home.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Validate Home Page Title
    [Documentation]    Validates the title of the home page using the hero title variable.
    Get Text    ${HERO_TITLE}    ==    Test Automation Practice

Validate Home Page Description
    [Documentation]    Validates the description of the home page using the hero description variable.
    Get Text
    ...    ${HERE_DESCRIPTION}
    ...    ==
    ...    Plataforma completa para prática de automação de testes. Explore diferentes cenários, elementos e funcionalidades para aprimorar suas habilidades em automação.

Validate If Cards Of Features Is Visible On Home Page
    ${KEYS}=    Get Dictionary Keys    ${HOME_CARDS}

    FOR    ${key}    IN    @{KEYS}
        Wait For Elements State    ${HOME_CARDS}[${key}] >> h3 >> text=${HOME_TITLE_CARDS}[${key}]    visible
        Wait For Elements State    ${HOME_CARDS}[${key}] >> p >> text=${HOME_DESCRIPTION_CARDS}[${key}]    visible
        Wait For Elements State    ${HOME_CARDS}[${key}] >> button >> text=Explorar    visible
    END

Click On Card Button
    [Documentation]    Clicks on the button of the specified card identified by the key.
    [Arguments]    ${key}
    Click    ${HOME_CARDS}[${key}] >> button

Validate Page Title
    [Documentation]    Validates the page title matches the expected title.
    [Arguments]    ${title_key}
    Wait For Elements State    ${PAGE_TITLE}    visible
    Get Text    ${PAGE_TITLE}    ==    ${PAGE_TITLE_TEXT}[${title_key}]

Validate Application Page URL
    [Documentation]    Validates the current page URL matches the expected URL.
    [Arguments]    ${resource_key}
    Validate Page URL    ${URL_RESOURCES}[${resource_key}]
