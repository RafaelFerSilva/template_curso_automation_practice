*** Settings ***
Resource    alerts.page.resource


*** Keywords ***
Validate If Static Alert Is Present
    [Arguments]    ${alert_key}    ${title}    ${description}
    Check Static Alert Title    ${alert_key}    ${title}
    Check Static Alert Description    ${alert_key}    ${description}

Valida If All Static Alerts Are Present
    Validate If Static Alert Is Present
    ...    STATIC_ALERT_INFORMATION
    ...    Informação
    ...    Este é um alerta informativo com detalhes importantes.

    Validate If Static Alert Is Present
    ...    STATIC_ALERT_SUCCESS
    ...    Sucesso
    ...    Operação realizada com sucesso! Todos os dados foram salvos.

    Validate If Static Alert Is Present
    ...    STATIC_ALERT_WARNING
    ...    Atenção
    ...    Verifique os dados antes de prosseguir. Esta ação não pode ser desfeita.

    Validate If Static Alert Is Present
    ...    STATIC_ALERT_ERROR
    ...    Erro
    ...    Ocorreu um erro durante o processamento. Tente novamente.

Check If Toast Notification Is Visible
    [Arguments]    ${title}    ${description}
    Check If Toast Notification Title Is Visible    ${title}
    Check If Toast Notification Description Is Visible    ${description}

Close Toast Notification
    [Arguments]    ${title}
    Click On Toast Notification Close Button
    Check If Toast Notification Title Is Visible    ${title}    hidden

Open Success Toast Notification
    Click On Toast Notification Button    SUCCESS    text=Toast de Sucesso
    Check If Toast Notification Is Visible    title=Sucesso!    description=Operação realizada com sucesso

Open Warning Toast Notification
    Click On Toast Notification Button    WARNING    text=Toast de Aviso
    Check If Toast Notification Is Visible    title=Atenção!    description=Verifique os dados

Open Erro Toast Notification
    Click On Toast Notification Button    ERRO    text=Toast de Erro
    Check If Toast Notification Is Visible    title=Erro!    description=Algo deu errado

Open Info Toast Notification
    Click On Toast Notification Button    INFO    text=Toast de Info
    Check If Toast Notification Is Visible    title=Informação    description=Dados atualizados
