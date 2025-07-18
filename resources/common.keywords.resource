*** Settings ***
Documentation       This resource file contains common keywords and settings for browser automation.

Library             Browser
Library             Collections
Variables           ${EXECDIR}/resources/config_variables.py


*** Keywords ***
Set Mobile context
    [Documentation]    Configures the browser context for a specific mobile device.
    ...
    ...    Uses the global variable DEVICE to get the device settings
    ...    and applies these settings to the browser context.

    ${device}=    Get Device    ${DEVICE}
    ${copy_new_context}=    Copy Dictionary    ${NEW_CONTEXT}    deepcopy=TRUE
    Set To Dictionary    ${copy_new_context}    &{device}
    New Context    &{copy_new_context}

Config New Context
    [Documentation]    Configures a new browser context based on the mobile device flag.
    ...
    ...    If MOBILE is true, configures a context for mobile device.
    ...    Otherwise, configures a default context using NEW_CONTEXT.

    IF    ${MOBILE}
        Set Mobile context
    ELSE
        New Context    &{NEW_CONTEXT}
    END

Open the Test Automation Practice Site
    [Documentation]    Opens the browser with settings defined in the NEW_CONTEXT object (config_variables.py).
    ...
    ...    Arguments:
    ...    - MOBILE: Flag to indicate if mobile configuration should be used (default: False)
    ...
    ...    Behavior:
    ...    - Opens a new browser with defined settings
    ...    - Configures appropriate context (mobile or desktop)
    ...    - Opens a new page with the defined URL
    [Arguments]    ${is_mobile}=False

    Set Suite Variable    ${MOBILE}    ${is_mobile}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    Config New Context
    New Page    /
