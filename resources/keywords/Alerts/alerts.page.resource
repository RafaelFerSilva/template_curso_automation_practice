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
    [Arguments]    ${title}    ${state}=visible    ${timeout}=10s
    ${element}=    Replace String    ${TOAST_NOTIFICATION_TITLE}    $$    ${title}
    Wait For Elements State    ${element}    ${state}    ${timeout}

Check If Toast Notification Description Is Visible
    [Arguments]    ${description}    ${state}=visible    ${timeout}=10s
    ${element}=    Replace String    ${TOAST_NOTIFICATION_DESCRIPTION}    $$    ${description}
    Wait For Elements State    ${element}    ${state}    ${timeout}

Click On Toast Notification Close Button
    Click    ${TOAST_NOTIFICATION_CLOSE_BUTTON}

Click On Browser Alert Button
    Click    ${BROWSER_ALERT_BUTTON}

Click On Browser Confirm Button
    Click    ${BROWSER_CONFIRM_BUTTON}

Click On Browser Prompt Button
    Click    ${BROWSER_PROMPT_BUTTON}

Click On Simple Modal Button
    Click    ${SIMPLE_MODAL_BUTTON}

Click On Dynamic Modal Button
    Click    ${DINAMIC_MODAL_BUTTON}

Click On Delete Modal Button
    Click    ${DELETE_MODAL_BUTTON}

Click On Form Modal Button
    Click    ${FORM_MODAL_BUTTON}

Click On Temp Alert Modal Button
    Click    ${TEMP_ALERT_MODAL_BUTTON}

Check If Simple Modal Is Visible
    [Arguments]    ${title}    ${description}    ${status_value}    ${state}=visible

    Wait For Elements State    ${SIMPLE_MODAL_COMPONENTE}[TITLE] >> text=${title}    ${state}
    Wait For Elements State    ${SIMPLE_MODAL_COMPONENTE}[DESCRIPTION] >> text=${description}    ${state}
    Wait For Elements State    ${SIMPLE_MODAL_COMPONENTE}[STATUS] >> text=${status_value}    ${state}
    Wait For Elements State    ${SIMPLE_MODAL_COMPONENTE}[BUTTON]    ${state}

Click On Simple Modal Close Button
    Click    ${SIMPLE_MODAL_COMPONENTE}[BUTTON]

Check If Delete Modal Is Visible
    [Arguments]    ${title}    ${description}    ${state}=visible

    Wait For Elements State    ${DELETE_MODAL_COMPONENTE}[TITLE] >> text=${title}    ${state}
    Wait For Elements State    ${DELETE_MODAL_COMPONENTE}[DESCRIPTION] >> text=${description}    ${state}
    Wait For Elements State    ${DELETE_MODAL_COMPONENTE}[CANCEL]    ${state}
    Wait For Elements State    ${DELETE_MODAL_COMPONENTE}[CONFIRM]    ${state}

Click To Cancel Delete Modal
    Click    ${DELETE_MODAL_COMPONENTE}[CANCEL]

Click To Confirm Delete Modal
    Click    ${DELETE_MODAL_COMPONENTE}[CONFIRM]

Check If Temp Modal Title Is Visible
    [Arguments]    ${title}    ${state}=visible
    ${element}=    Replace String    ${TEMP_MODAL_TOAST_TITLE}    $$    ${title}
    Wait For Elements State    ${element}    ${state}

Check if Form Modal Is Visible
    [Arguments]    ${title}    ${description}    ${state}=visible

    Wait For Elements State    ${MODAL_FORM_COMPONENT}[TITLE] >> text=${title}    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[DESCRIPTION] >> text=${description}    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[NAME]    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[EMAIL]    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[MENSAGEM]    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[CANCEL]    ${state}
    Wait For Elements State    ${MODAL_FORM_COMPONENT}[CONFIRM]    ${state}

Input Values On Form Modal
    [Arguments]    ${name}    ${email}    ${mensagem}

    Type Text    ${MODAL_FORM_COMPONENT}[NAME]    ${name}
    Type Text    ${MODAL_FORM_COMPONENT}[EMAIL]    ${email}
    Type Text    ${MODAL_FORM_COMPONENT}[MENSAGEM]    ${mensagem}

Click On Form Modal Cancel Button
    Click    ${MODAL_FORM_COMPONENT}[CANCEL]

Click On Form Modal Send Button
    Click    ${MODAL_FORM_COMPONENT}[CONFIRM]

Check If Alert Auto Dismiss Message Is Visible
    [Arguments]    ${message}    ${state}=visible    ${timeout}=10s
    ${element}=    Replace String    ${ALERT_AUTO_DISMISS}    $$    ${message}
    Wait For Elements State    ${element}    ${state}    ${timeout}
