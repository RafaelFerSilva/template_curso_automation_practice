*** Settings ***
Library     Browser
Resource    form.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Type Text On Form Input
    [Arguments]    ${key}    ${text}
    Type Text    ${FORM}[${key}]    ${text}
    Get Text    ${FORM}[${key}]    ==    ${text}
    Keyboard Key    press    Tab

Type User Birthday
    [Arguments]    ${birth_date}
    Type Date    ${birth_date}    ${FORM}[BIRTHDAY]
    ${form_data}=    Get Text    ${FORM}[BIRTHDAY]
    Should Be Equal As Strings    ${form_data}    ${birth_date}

Select User Gender
    [Arguments]    ${gender}
    Click    ${FORM}[GENDER]
    Click    span >> text=${gender}
    Get Text    ${FORM}[GENDER] >> span    ==    ${gender}

Select User State
    [Arguments]    ${state}
    Click    ${FORM}[STATE]
    Click    span >> text="${state}"
    Get Text    ${FORM}[STATE] >> span    ==    ${state}

Check To Send Payment Information
    Check Checkbox    ${FORM}[WANTS_PAYMENT]
    Get Checkbox State    ${FORM}[WANTS_PAYMENT]    ==    True

Click On Form Submit Button
    Click    ${FORM}[SUBMIT_BUTTON]

Click On Form Clean Button
    Click    ${FORM}[CLEAN_FORM]

Check If Success Toast Appears
    [Documentation]    Waits for and verifies the appearance of a success toast message indicating successful form submission.
    [Arguments]    ${try}=1    ${timeout}=20s
    Wait For Elements State
    ...    ${FORM}[FORM_TOAST_TITLE]${try} >> text=Formulário enviado com sucesso!
    ...    visible
    ...    ${timeout}

    Wait For Elements State
    ...    ${FORM}[FORM_TOAST_DESCRIPTION]${try} >> text=Tentativa ${try} realizada com sucesso.
    ...    visible
    ...    ${timeout}

Check If Error Toast Appears
    [Documentation]    Waits for and verifies the appearance of an error toast message indicating validation errors.
    [Arguments]    ${try}=1    ${timeout}=20s
    Wait For Elements State    ${FORM}[FORM_TOAST_TITLE]${try} >> text=Erro na validação
    ...    visible
    ...    ${timeout}=10s

    Wait For Elements State
    ...    ${FORM}[FORM_TOAST_DESCRIPTION]${try} >> text=Corrija os erros antes de enviar.
    ...    visible
    ...    ${timeout}

Check If Form Is Empty
    [Documentation]    Iterates through form elements and asserts they are empty or in their default state.

    # Mapeia os valores esperados para campos específicos
    &{expected_values}=    Create Dictionary
    ...    GENDER=Selecione
    ...    STATE=Selecione o estado

    FOR    ${key}    IN    @{FORM.keys()}
        # Ignora chaves que não precisam de verificação
        IF    '${key}' in ['CLEAN_FORM', 'SUBMIT_BUTTON', 'FORM_TOAST', 'FORM_TOAST_TITLE', 'FORM_TOAST_DESCRIPTION']
            CONTINUE
        END

        # Caso especial para WANTS_PAYMENT
        IF    '${key}' == 'WANTS_PAYMENT'
            Check To Send Payment Information
            CONTINUE
        END

        # Verifica valor esperado no dicionário ou vazio por padrão
        ${expected}=    Set Variable If    '${key}' in ${expected_values}    ${expected_values['${key}']}    ${EMPTY}
        Get Text    ${FORM}[${key}]    ==    ${expected}
    END

Validate Mandatory Fields Error Messages
    [Documentation]    Iterates through all form inputs and checks for mandatory field error messages.

    # Mapeia os valores esperados para campos específicos
    &{expected_values}=    Create Dictionary
    ...    GENDER=//button
    ...    STATE=//button

    FOR    ${key}    IN    @{FORM.keys()}
        # Ignora chaves que não precisam de verificação
        IF    '${key}' in ['CLEAN_FORM', 'SUBMIT_BUTTON', 'FORM_TOAST', 'FORM_TOAST_TITLE', 'FORM_TOAST_DESCRIPTION', 'WANTS_PAYMENT']
            CONTINUE
        END

        ${element}=    Set Variable If
        ...    '${key}' in ${expected_values}
        ...    ${expected_values['${key}']}
        ...    //input

        ${xpath_locator}=    Generate Xpath By Attribute
        ...    xpath_attribute=${FORM}[${key}]
        ...    html_element=${element}
        ...    xpath_extension=//following-sibling::p

        Wait For Elements State    ${xpath_locator} >> text=${FORM_ERRORS['${key}']}    visible
    END

Validate Format Fields Error Messages
    [Documentation]    Iterates through all form inputs and checks for format-specific error messages.
    # Mapeia os valores esperados para campos específicos
    &{expected_values}=    Create Dictionary
    ...    GENDER=//button
    ...    STATE=//button

    FOR    ${key}    IN    @{FORM.keys()}
        # Ignora chaves que não precisam de verificação
        IF    '${key}' in ['BIRTHDAY', 'GENDER', 'STATE', 'ADDRESS', 'CITY','CLEAN_FORM', 'SUBMIT_BUTTON', 'FORM_TOAST', 'FORM_TOAST_TITLE', 'FORM_TOAST_DESCRIPTION', 'WANTS_PAYMENT']
            CONTINUE
        END

        ${element}=    Set Variable If
        ...    '${key}' in ${expected_values}
        ...    ${expected_values['${key}']}
        ...    //input

        ${xpath_locator}=    Generate Xpath By Attribute
        ...    xpath_attribute=${FORM}[${key}]
        ...    html_element=${element}
        ...    xpath_extension=//following-sibling::p

        Wait For Elements State    ${xpath_locator} >> text=${FORM_FORMAT_ERRORS['${key}']}    visible
    END

Validate Error Message When Passwords Is Not Equal
    ${xpath_locator}=    Generate Xpath By Attribute
    ...    xpath_attribute=${FORM}[CONFIRM_PASSWORD]
    ...    html_element=//input
    ...    xpath_extension=//following-sibling::p
    Wait For Elements State    ${xpath_locator} >> text=Senhas não coincidem    visible
