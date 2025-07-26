*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Alerts/alerts.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    ALERTS

Test Tags       web    alerts


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
