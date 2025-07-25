*** Settings ***
Library     Browser
Resource    form.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Type Text On Form Input
    [Arguments]    ${key}    ${text}
    Type Text    ${FORM}[${key}]    ${text}
    Get Text    ${FORM}[${key}]    ==    ${text}

Type User Birthday
    [Arguments]    ${birth_date}
    Type Date    ${birth_date}    ${FORM}[BIRTHDAY]
    ${form_data} =    Get Text    ${FORM}[BIRTHDAY]
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
    FOR    ${key}    IN    @{FORM.keys()}
        IF    '${key}' == 'GENDER'
            Get Text    ${FORM}[${key}]    ==    Selecione
        ELSE IF    '${key}' == 'STATE'
            Get Text    ${FORM}[${key}]    ==    Selecione o estado
        ELSE IF    '${key}' == 'WANTS_PAYMENT'
            Check To Send Payment Information
        ELSE IF    '${key}' in ['CLEAN_FORM', 'SUBMIT_BUTTON', 'FORM_TOAST', 'FORM_TOAST_TITLE','FORM_TOAST_DESCRIPTION']
            CONTINUE
        ELSE
            Get Text    ${FORM}[${key}]    ==    ${EMPTY}
        END
    END
