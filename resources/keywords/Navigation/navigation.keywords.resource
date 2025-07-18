*** Settings ***
Library     Browser
Library     Collections
Resource    ${EXECDIR}/resources/keywords/Home/home.page.resource


*** Variables ***
&{MENU_ITEMS}               ELEMENTS=data-testid=nav-item-elementos
...                         FORMS=data-testid=nav-item-formulários
...                         ALERTS=data-testid=nav-item-alertas
...                         WIDGETS=data-testid=nav-item-widgets
...                         TABLES=data-testid=nav-item-tabelas
...                         FILES=data-testid=nav-item-arquivos
...                         AUTH=data-testid=nav-item-auth
...                         CRUD=data-testid=nav-item-crud
...                         API=data-testid=nav-item-api
...                         CHALLENGES=data-testid=nav-item-desafios
...                         PERFORMANCE=data-testid=nav-item-performance
...                         DOC=data-testid=nav-item-docs

${MOBILE_MENU_BUTTON}=      data-testid=nav-menu-toggle

&{MOBILE_MENU_ITEMS}        ELEMENTS=data-testid=nav-item-mobile-elementos
...                         FORMS=data-testid=nav-item-mobile-formulários
...                         ALERTS=data-testid=nav-item-mobile-alertas
...                         WIDGETS=data-testid=nav-item-mobile-widgets
...                         TABLES=data-testid=nav-item-mobile-tabelas
...                         FILES=data-testid=nav-item-mobile-arquivos
...                         AUTH=data-testid=nav-item-mobile-auth
...                         CRUD=data-testid=nav-item-mobile-crud
...                         API=data-testid=nav-item-mobile-api
...                         CHALLENGES=data-testid=nav-item-mobile-desafios
...                         PERFORMANCE=data-testid=nav-item-mobile-performance
...                         DOC=data-testid=nav-item-mobile-docs


*** Keywords ***
Click On Menu Item
    [Documentation]    Clicks on a menu item based on the provided key.
    [Arguments]    ${menu_item_key}
    Click    ${MENU_ITEMS}[${menu_item_key}]

Click On Menu Item And Validate Navigation
    [Arguments]    ${menu_item_key}
    Click On Menu Item    ${menu_item_key}
    Wait For Load State    domcontentloaded
    Validate Application Page URL    ${menu_item_key}
    Validate Page Title    ${menu_item_key}

Click on each of the menu items and validate navigation
    ${keys}=    Get Dictionary Keys    ${MENU_ITEMS}
    FOR    ${menu_item_key}    IN    @{keys}
        Click On Menu Item And Validate Navigation    ${menu_item_key}
        Go Back
    END

Click On Mobile Menu Button
    Click    ${MOBILE_MENU_BUTTON}

Click On Mobile Menu Item
    [Arguments]    ${menu_item_key}
    Scroll To Element    ${MOBILE_MENU_ITEMS}[${menu_item_key}]
    Click    ${MOBILE_MENU_ITEMS}[${menu_item_key}]

Click On Mobile Menu Item And Validate Navigation
    [Arguments]    ${menu_item_key}
    Click On Mobile Menu Button
    Click On Mobile Menu Item    ${menu_item_key}
    Validate Application Page URL    ${menu_item_key}
    Validate Page Title    ${menu_item_key}

Click On Each Of The Mobile Menu Items And Validate Navigation
    FOR    ${menu_item_key}    IN    @{MOBILE_MENU_ITEMS.keys()}
        Click On Mobile Menu Item And Validate Navigation    ${menu_item_key}
    END
