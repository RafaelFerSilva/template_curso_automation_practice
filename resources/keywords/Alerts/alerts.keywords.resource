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
    [Arguments]    ${title}    ${description}    ${state}=visible    ${timeout}=10s
    Check If Toast Notification Title Is Visible    ${title}    ${state}    ${timeout}
    Check If Toast Notification Description Is Visible    ${description}    ${state}    ${timeout}

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

Execute Browser Alert
    [Arguments]    ${text}    ${action}=accept

    ${promise} =    Promise To    Wait For Alert    action=${action}    text=${text}
    Click On Browser Alert Button
    ${text} =    Wait For    ${promise}
    Log Many    ${text}

Execute Confirm/Dismiss Browser Alert
    [Arguments]    ${text}    ${action}=accept

    ${promise} =    Promise To    Wait For Alert    action=${action}    text=${text}
    Click On Browser Confirm Button
    ${text} =    Wait For    ${promise}
    Log Many    ${text}

Execute Prompt Browser Alert
    [Arguments]    ${alert_text}    ${prompt_input}    ${action}=accept

    ${promise} =    Promise To
    ...    Wait For Alert
    ...    action=${action}
    ...    text=${alert_text}
    ...    prompt_input=${prompt_input}
    Click On Browser Prompt Button
    ${text} =    Wait For    ${promise}
    Log Many    ${text}

Open Simple Modal
    [Arguments]    ${title}    ${description}    ${status_value}
    Click On Simple Modal Button
    Check If Simple Modal Is Visible    ${title}    ${description}    ${status_value}

Close Simple Modal
    [Arguments]    ${title}    ${description}    ${status_value}
    Click On Simple Modal Close Button
    Check If Simple Modal Is Visible    ${title}    ${description}    ${status_value}    hidden

Open Delete Modal
    [Arguments]    ${title}    ${description}    ${state}=visible
    Click On Delete Modal Button
    Check If Delete Modal Is Visible    ${title}    ${description}    ${state}

Cancel Delete Modal
    [Arguments]    ${title}    ${description}
    Click To Cancel Delete Modal
    Check If Delete Modal Is Visible    ${title}    ${description}    hidden

Confirm Delete Modal
    [Arguments]    ${title}    ${description}
    Click To Confirm Delete Modal
    Check If Delete Modal Is Visible    ${title}    ${description}    hidden

Open Form Modal
    [Arguments]    ${title}    ${description}
    Click On Form Modal Button
    Check if Form Modal Is Visible    ${title}    ${description}

Send Modal Information
    [Arguments]    ${name}    ${email}    ${mensagem}

    Input Values On Form Modal    ${name}    ${email}    ${mensagem}
    Click On Form Modal Send Button

Open Dinamic Alert
    [Arguments]    ${message}
    Click On Dynamic Modal Button
    Check If Alert Auto Dismiss Message Is Visible    ${message}

Wait Until Alert Is Dismissed
    [Arguments]    ${message}    ${timeout}=10s
    Check If Alert Auto Dismiss Message Is Visible    ${message}    hidden    ${timeout}
