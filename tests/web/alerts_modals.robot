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

Should Be Possible Open Simple Modal
    [Tags]    simple_modal    modal_test
    Open Simple Modal
    ...    Modal de Informação
    ...    Esta é uma janela modal com informações importantes. Você pode interagir com os elementos aqui dentro.
    ...    Este modal foi aberto 1 vez(es) durante esta sessão.

    [Teardown]    Close Simple Modal
    ...    Modal de Informação
    ...    Esta é uma janela modal com informações importantes. Você pode interagir com os elementos aqui dentro.
    ...    Este modal foi aberto 1 vez(es) durante esta sessão.

Should Be Possible Confirm Delete Modal
    [Tags]    delete_modal    modal
    Open Delete Modal
    ...    Você tem certeza?
    ...    Esta ação não pode ser desfeita. Isso irá remover permanentemente os dados selecionados.
    Confirm Delete Modal
    ...    Você tem certeza?
    ...    Esta ação não pode ser desfeita. Isso irá remover permanentemente os dados selecionados.
    Check If Toast Notification Is Visible    title=Ação confirmada    description=Você escolheu: Confirmar

Should Be Possible Cancel Delete Modal
    [Tags]    delete_modal    modal
    Open Delete Modal
    ...    Você tem certeza?
    ...    Esta ação não pode ser desfeita. Isso irá remover permanentemente os dados selecionados.
    Cancel Delete Modal
    ...    Você tem certeza?
    ...    Esta ação não pode ser desfeita. Isso irá remover permanentemente os dados selecionados.

Should Be Possible Execute Temp Alert Modal
    [Tags]    temp_alert_modal    modal
    Click On Temp Alert Modal Button

    Check If Toast Notification Is Visible
    ...    title=Aguarde...
    ...    description=Processando solicitação...
    ...    timeout=20s
    Check If Toast Notification Is Visible
    ...    title=Aguarde...
    ...    description=Processando solicitação...
    ...    state=hidden
    ...    timeout=20s

    Check If Toast Notification Is Visible    title=Concluído!    description=Operação realizada com sucesso
    Check If Toast Notification Is Visible
    ...    title=Concluído!
    ...    description=Operação realizada com sucesso
    ...    state=hidden

Should Be Possible Send Form Modal Information
    [Tags]    form_modal    modal
    ${name}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${mensagem}=    FakerLibrary.Catch Phrase

    Open Form Modal
    ...    Enviar Mensagem
    ...    Preencha o formulário abaixo para enviar uma mensagem.

    Send Modal Information
    ...    ${name}
    ...    ${email}
    ...    ${mensagem}

    Check If Toast Notification Is Visible    title=Formulário enviado    description=Dados salvos com sucesso!

Should Be Possible Cancel Form Modal
    [Tags]    form_modal    modal
    ${name}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${mensagem}=    FakerLibrary.Catch Phrase

    Open Form Modal
    ...    Enviar Mensagem
    ...    Preencha o formulário abaixo para enviar uma mensagem.
    Input Values On Form Modal    ${name}    ${email}    ${mensagem}
    Click On Form Modal Cancel Button

Should Not Be Possible Send Modal Without Mandatory Information
    [Tags]    form_modal    modal
    ${name}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${mensagem}=    FakerLibrary.Catch Phrase

    Open Form Modal
    ...    Enviar Mensagem
    ...    Preencha o formulário abaixo para enviar uma mensagem.
    Click On Form Modal Send Button
    Check If Toast Notification Is Visible    title=Campos obrigatórios    description=Preencha todos os campos

    Input Values On Form Modal    ${name}    ${email}    ${mensagem}
    Click On Form Modal Send Button
    Check If Toast Notification Is Visible    title=Formulário enviado    description=Dados salvos com sucesso!

Should Be Dismissed Alert After Secounds
    [Tags]    alert    dynamic
    Open Dinamic Alert    Este alerta desaparecerá automaticamente em 5 segundos
    Wait Until Alert Is Dismissed     Este alerta desaparecerá automaticamente em 5 segundos   7s
