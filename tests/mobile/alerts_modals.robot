*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Alerts/alerts.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    is_mobile=True    AND
...                 Click On Card And Validate Navigation    ALERTS

Test Tags       mobile    alerts    alerts_mobile


*** Test Cases ***
Validate Static Alerts
    Valida If All Static Alerts Are Present

Should Display Toast Notifications
    Open Success Toast Notification
    Close Toast Notification    Sucesso!

    Open Warning Toast Notification
    Close Toast Notification    Atenção!

    Open Erro Toast Notification
    Close Toast Notification    Erro!

    Open Info Toast Notification
    Close Toast Notification    Informação

Validate that the notification disappears after seconds
    Open Success Toast Notification
    Check If Toast Notification Title Is Visible    Sucesso!    hidden

    Open Warning Toast Notification
    Check If Toast Notification Title Is Visible    Atenção!    hidden

    Open Erro Toast Notification
    Check If Toast Notification Title Is Visible    Erro!    hidden

    Open Info Toast Notification
    Check If Toast Notification Title Is Visible    Informação    hidden

Should Be Possible Accept Browser Alert
    [Tags]    dialog_alert
    Execute Browser Alert    text=Este é um alerta do navegador!    action=accept

Should Be Possible Dismiss Browser Alert
    [Tags]    dialog_alert
    Execute Confirm/Dismiss Browser Alert    text=Você tem certeza que deseja continuar?    action=dismiss
    Check If Toast Notification Is Visible    title=Resposta do confirm    description=Você escolheu: Cancelar

Should Be Possible Confirm Browser Alert
    [Tags]    dialog_alert
    Execute Confirm/Dismiss Browser Alert    text=Você tem certeza que deseja continuar?    action=accept
    Check If Toast Notification Is Visible    title=Resposta do confirm    description=Você escolheu: OK

Should Be Possible Confirm Handle Prompt Alert
    [Tags]    dialog_alert
    ${message}=    FakerLibrary.Name
    Execute Prompt Browser Alert
    ...    alert_text=Digite seu nome:
    ...    action=accept
    ...    prompt_input=${message}
    Check If Toast Notification Is Visible    title=Resposta do prompt    description=Você digitou: ${message}

Should Be Possible Dismiss Handle Prompt Alert
    [Tags]    dialog_alert
    ${message}=    FakerLibrary.Name
    Execute Prompt Browser Alert
    ...    alert_text=Digite seu nome:
    ...    action=dismiss
    ...    prompt_input=${message}
