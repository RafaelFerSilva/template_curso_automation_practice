*** Settings ***
Library     Browser
Library     String
Resource    alerts.variables.resource


*** Keywords ***
Check Static Alert Title
    [Arguments]    ${alert_key}    ${title}
    ${element}=    Replace String    ${STATIC_ALERTS_TITLES}[${alert_key}]    $$    ${title}
    Wait For Elements State    ${element}    visible

Check Static Alert Description
    [Arguments]    ${alert_key}    ${description}
    ${element}=    Replace String    ${STATIC_ALERTS_DESCRIPTIONS}[${alert_key}]    $$    ${description}
    Wait For Elements State    ${element}    visible

Click On Toast Notification Button
    [Arguments]    ${toast_key}    ${text}
    ${element}=    Replace String    ${TOAST_NOTIFICATION_${toast_key.upper()}_BUTTON}    $$    ${text}
    Click    ${element}

Check If Toast Notification Title Is Visible
    [Arguments]    ${title}    ${state}=visible
    ${element}=    Replace String    ${TOAST_NOTIFICATION_TITLE}    $$    ${title}
    Wait For Elements State    ${element}    ${state}

Check If Toast Notification Description Is Visible
    [Arguments]    ${description}    ${state}=visible
    ${element}=    Replace String    ${TOAST_NOTIFICATION_DESCRIPTION}    $$    ${description}
    Wait For Elements State    ${element}    ${state}

Click On Toast Notification Close Button
    Click    ${TOAST_NOTIFICATION_CLOSE_BUTTON}
