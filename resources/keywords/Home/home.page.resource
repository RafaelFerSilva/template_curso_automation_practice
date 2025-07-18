*** Settings ***
Library     Browser
Library     Collections
Resource    ${EXECDIR}/resources/keywords/Home/home.variables.resource


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
