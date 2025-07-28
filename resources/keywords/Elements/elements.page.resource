*** Settings ***
Library     Browser
Library     Collections
Library     String
Resource    elements.variables.resource
Resource    ${EXECDIR}/resources/common.keywords.resource


*** Keywords ***
Validate if Basic Primary Button Is Visible
    Wait For Elements State    ${PRIMARY_BUTTON}    visible

Validate if Basic Secondary Button Is Visible
    Wait For Elements State    ${SECONDARY_BUTTON}    visible

Validate if Basic Outline Button Is Visible
    Wait For Elements State    ${OUTLINE_BUTTON}    visible

Validate if Basic Ghost Button Is Visible
    Wait For Elements State    ${GHOST_BUTTON}    visible

Validate if Basic Link Button Is Visible
    Wait For Elements State    ${LINK_BUTTON}    visible

Validate if Basic Destructive Button Is Visible
    Wait For Elements State    ${DESTRUCTIVE_BUTTON}    visible

Check Disabled Button
    Wait For Elements State    ${DISABLED_BUTTON}    disabled

Click On Disabled Button
    Click    ${DISABLED_BUTTON}

Check Loading Button
    [Arguments]    ${text}
    Wait For Elements State    ${LOAD_BUTTON}    visible
    Get Text    ${LOAD_BUTTON}    ==    ${text}

Click On Loading Button
    Click    ${LOAD_BUTTON}

Check Load Button State
    [Arguments]    ${property}
    Wait For Elements State    ${LOAD_BUTTON}    state=${property}

Check Loading Toast Title
    [Arguments]    ${title}
    Wait For Elements State    ${TOAST-1} >> ${TOAST-TITLE-1} >> text=${title}    visible

Check Loading Toast Description
    [Arguments]    ${description}
    Wait For Elements State    ${TOAST-1} >> ${TOAST-DESCRIPTION-1} >> text=${description}    visible

Check If Play Button Is Visible
    Wait For Elements State    ${BUTTON_PLAY}    visible

Check If Pause Button Is Visible
    Wait For Elements State    ${BUTTON_PAUSE}    visible

Check If Stop Button Is Visible
    Wait For Elements State    ${BUTTON_STOP}    visible

Check If Download Button Is Visible
    Wait For Elements State    ${BUTTON_DOWNLOAD}    visible

Check If Upload Button Is Visible
    Wait For Elements State    ${BUTTON_UPLOAD}    visible

Click On Button To Show Dynamic Element
    Click    ${BUTTON_SHOW}

Click On Button To Hide Dynamic Element
    Click    ${BUTTON_HIDE}

Check If Dynamic Element State
    [Arguments]    ${state}=visible
    Wait For Elements State    ${STATS_VALUE_DYNAMIC_ELEMENT}    ${state}

Check Form Input Text
    [Arguments]    ${expected_placeholder}    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_TEXT}    ${state}
    ${placeholder}=    Get Attribute    ${CARD_FORM_ELEMENTS_INPUT_TEXT}    placeholder
    Should Be Equal As Strings    ${placeholder}    ${expected_placeholder}

Check Form Input Email
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_EMAIL}    ${state}

Check Form Input Password
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_PASSWORD}    ${state}

Check Form Input Number
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_NUMBER}    ${state}

Check Form Input Date
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_DATE}    ${state}

Check Form Input File
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_FILE}    ${state}

Check Form Input TextArea
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_TEXTAREA}    ${state}

Check Form Input Select
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${CARD_FORM_ELEMENTS_INPUT_SELECT}    ${state}

Click On Disabled Form Button
    Click    ${BUTTON_DISABLE}

Click On Enabled Form Button
    Click    ${BUTTON_ENABLE}

Validate Check Box State
    [Arguments]    ${option}=1    ${state}=enabled
    Wait For Elements State    ${CHECK_BOX_OPTION_${option}}    ${state}

Validate Check Box Data State
    [Arguments]    ${option}=1    ${expected_state}=checked
    ${actual_state}=    Get Attribute    ${CHECK_BOX_OPTION_${option}}    data-state
    Should Be Equal As Strings    ${actual_state}    ${expected_state}

Perform Check On Check Box
    [Arguments]    ${option}=1
    Check Checkbox    ${CHECK_BOX_OPTION_${option}}
    Validate Check Box Data State    ${option}    checked

Perform Uncheck On Check Box
    [Arguments]    ${option}=1
    Uncheck Checkbox    ${CHECK_BOX_OPTION_${option}}
    Validate Check Box Data State    ${option}    unchecked

Validate Radio Button State
    [Arguments]    ${option}=1    ${state}=enabled
    Wait For Elements State    ${RADIO_OPTION_${option}}    ${state}

Validate Radio Button Data State
    [Arguments]    ${option}=1    ${expected_state}=checked
    ${actual_state}=    Get Attribute    ${RADIO_OPTION_${option}}    data-state
    Should Be Equal As Strings    ${actual_state}    ${expected_state}

Perform Check On Radio Button
    [Arguments]    ${option}=1
    Check Checkbox    ${RADIO_OPTION_${option}}
    Validate Radio Button Data State    ${option}    checked

Perform Uncheck On Radio Button
    [Arguments]    ${option}=1
    Uncheck Checkbox    ${RADIO_OPTION_${option}}
    Validate Radio Button Data State    ${option}    unchecked

Validate Swith Notification Button
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${SWITCH_NOTIFICATIONS}    ${state}

Validate Swith Notification Button Data State
    [Arguments]    ${option}=1    ${expected_state}=checked
    ${actual_state}=    Get Attribute    ${SWITCH_NOTIFICATIONS}    data-state
    Should Be Equal As Strings    ${actual_state}    ${expected_state}

Perform Check On Swith Notification Button
    [Arguments]    ${option}=1
    Check Checkbox    ${SWITCH_NOTIFICATIONS}
    Validate Swith Notification Button Data State    ${option}    checked

Perform Uncheck On Swith Notification Button
    [Arguments]    ${option}=1
    Uncheck Checkbox    ${SWITCH_NOTIFICATIONS}
    Validate Swith Notification Button Data State    ${option}    unchecked

Validate Counter Minus Button
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${BUTTON_COUNTER_MINUS}    ${state}

Click On Counter Minus Button
    Click    ${BUTTON_COUNTER_MINUS}

Validate Counter Plus Button
    [Arguments]    ${state}=enabled
    Wait For Elements State    ${BUTTON_COUNTER_PLUS}    ${state}

Click On Counter Plus Button
    Click    ${BUTTON_COUNTER_PLUS}

Check Counter Display Value
    [Arguments]    ${expected_value}
    Get Text    ${STATUS_VALUE_COUNTER}    ==    ${EXPECTED_COUNTER_VALUE}

Type User Name
    [Arguments]    ${username}
    Type Text    ${CARD_FORM_ELEMENTS_INPUT_TEXT}    ${username}
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_TEXT}    ==    ${username}

Type User Email
    [Arguments]    ${email}
    Type Text    ${CARD_FORM_ELEMENTS_INPUT_EMAIL}    ${email}
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_EMAIL}    ==    ${email}

Type User Password
    [Arguments]    ${password}
    Type Secret    ${CARD_FORM_ELEMENTS_INPUT_PASSWORD}    $password
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_PASSWORD}    ==    ${password}

Type User Number
    [Arguments]    ${number}
    Type Text    ${CARD_FORM_ELEMENTS_INPUT_NUMBER}    ${number}
    ${number_string}=    Convert To String    ${number}
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_NUMBER}    ==    ${number_string}

Type User Age
    [Arguments]    ${age}
    Type Date    ${age}    ${CARD_FORM_ELEMENTS_INPUT_DATE}

Type User Message
    [Arguments]    ${message}
    Type Text    ${CARD_FORM_ELEMENTS_INPUT_TEXTAREA}    ${message}
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_TEXTAREA}    ==    ${message}

Select User Option
    [Arguments]    ${option}
    Click    ${CARD_FORM_ELEMENTS_INPUT_SELECT}
    Click    span >> text=${option}
    Get Text    ${CARD_FORM_ELEMENTS_INPUT_SELECT} >> span    ==    ${option}

Select User File
    [Arguments]    ${file_path}
    Upload File By Selector    ${CARD_FORM_ELEMENTS_INPUT_FILE}    ${file_path}

Verify Slider Value
    [Documentation]    Verifica se o slider está no valor esperado
    [Arguments]    ${expected_value}    ${tolerance}=2

    # Aguarda um pouco para o valor se estabilizar
    Sleep    0.2s

    ${final_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuenow
    ${final_value}=    Convert To Number    ${final_value}
    ${difference}=    Evaluate    abs(${final_value} - ${expected_value})

    Log    Verificação - Valor final: ${final_value}, Esperado: ${expected_value}, Diferença: ${difference}

    Should Be True
    ...    ${difference} <= ${tolerance}
    ...    msg=Slider não chegou no valor esperado. Final: ${final_value}, Esperado: ${expected_value}, Diferença: ${difference}

Move Slider With Drag
    [Documentation]    Move o slider usando drag and drop no thumb
    [Arguments]    ${desired_value}    ${current_value}    ${min_value}    ${max_value}    ${tolerance}

    # Obtém as dimensões da track para calcular o movimento
    ${track_box}=    Get Bounding Box    ${SLIDER_TRACK}
    ${track_width}=    Set Variable    ${track_box}[width]

    # Obtém a posição atual do thumb
    ${thumb_box}=    Get Bounding Box    ${SLIDER_TRUMB}

    # Calcula o offset necessário
    ${range_total}=    Evaluate    ${max_value} - ${min_value}
    ${current_percent}=    Evaluate    (${current_value} - ${min_value}) / ${range_total}
    ${desired_percent}=    Evaluate    (${desired_value} - ${min_value}) / ${range_total}

    ${current_pixel}=    Evaluate    ${track_width} * ${current_percent}
    ${desired_pixel}=    Evaluate    ${track_width} * ${desired_percent}
    ${offset}=    Evaluate    int(${desired_pixel} - ${current_pixel})

    Log    Drag Info - Track Width: ${track_width}, Offset: ${offset}px

    # Primeiro, foca no thumb para garantir que está ativo
    Focus    ${SLIDER_TRUMB}
    Sleep    0.1s

    # Executa o drag and drop
    Drag And Drop Relative To    ${SLIDER_TRUMB}    ${offset}    0
    Sleep    0.5s

    # Verifica se chegou no valor desejado
    Verify Slider Value    ${desired_value}    ${tolerance}

Move Slider With Keys
    [Documentation]    Move o slider usando teclas de seta (mais preciso para ajustes finos)
    [Arguments]    ${desired_value}    ${current_value}    ${tolerance}

    # Foca no slider thumb
    Focus    ${SLIDER_TRUMB}
    Sleep    0.1s

    ${difference}=    Evaluate    ${desired_value} - ${current_value}
    ${steps}=    Evaluate    abs(int(${difference}))

    IF    ${difference} > 0
        ${key}=    Set Variable    ArrowRight
        Log    Movendo ${steps} passos para a direita
    ELSE
        ${key}=    Set Variable    ArrowLeft
        Log    Movendo ${steps} passos para a esquerda
    END

    # Move passo a passo
    FOR    ${i}    IN RANGE    ${steps}
        Keyboard Key    press    ${key}
        Sleep    0.05s

        # Verifica se já chegou no valor (otimização)
        ${current}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuenow
        ${current}=    Convert To Number    ${current}
        ${diff}=    Evaluate    abs(${current} - ${desired_value})
        IF    ${diff} < ${tolerance}
            Log    Valor alcançado antecipadamente no passo ${i+1}
            BREAK
        END
    END

    Sleep    0.3s
    Verify Slider Value    ${desired_value}    ${tolerance}

Get Slider Debug Info
    [Documentation]    Retorna informações de debug do slider

    ${current_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuenow
    ${min_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuemin
    ${max_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuemax

    ${track_box}=    Get Bounding Box    ${SLIDER_TRACK}
    ${thumb_box}=    Get Bounding Box    ${SLIDER_TRUMB}

    Log    === SLIDER DEBUG INFO ===
    Log    Current Value: ${current_value}
    Log    Min Value: ${min_value}
    Log    Max Value: ${max_value}
    Log    Track Box: ${track_box}
    Log    Thumb Box: ${thumb_box}
    Log    ========================

Set Slider Value
    [Documentation]    Define o valor do slider de forma dinâmica
    ...    Calcula a posição atual e move para o valor desejado
    [Arguments]    ${desired_value}    ${tolerance}=2

    # Aguarda o elemento estar visível e interagível
    Wait For Elements State    ${SLIDER_TRUMB}    visible    timeout=10s
    Wait For Elements State    ${SLIDER_TRUMB}    stable    timeout=5s

    # Obtém os valores atuais do slider
    ${current_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuenow
    ${min_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuemin
    ${max_value}=    Get Attribute    ${SLIDER_TRUMB}    aria-valuemax

    # Converte para números
    ${current_value}=    Convert To Number    ${current_value}
    ${min_value}=    Convert To Number    ${min_value}
    ${max_value}=    Convert To Number    ${max_value}
    ${desired_value}=    Convert To Number    ${desired_value}

    Log    Slider Info - Current: ${current_value}, Min: ${min_value}, Max: ${max_value}, Desired: ${desired_value}

    # Validações
    Should Be True    ${desired_value} >= ${min_value}
    ...    msg=Valor desejado (${desired_value}) menor que o mínimo (${min_value})
    Should Be True    ${desired_value} <= ${max_value}
    ...    msg=Valor desejado (${desired_value}) maior que o máximo (${max_value})

    # Se já está no valor desejado, retorna
    ${difference}=    Evaluate    abs(${desired_value} - ${current_value})
    IF    ${difference} <= ${tolerance}
        Log    Slider já está no valor desejado (diferença: ${difference})
        RETURN
    END

    # Estratégia 1: Drag and Drop no thumb
    ${success}=    Run Keyword And Return Status
    ...    Move Slider With Drag
    ...    ${desired_value}
    ...    ${current_value}
    ...    ${min_value}
    ...    ${max_value}
    ...    ${tolerance}

    IF    ${success}    RETURN

    # Estratégia 2: Teclas de seta
    ${success}=    Run Keyword And Return Status
    ...    Move Slider With Keys    ${desired_value}    ${current_value}    ${tolerance}

    Get Slider Debug Info

    IF    not ${success}
        Take Screenshot
        Fail    Não foi possível mover o slider para o valor desejado: ${desired_value}
    END

Progress Bar Display Should Show
    [Documentation]    Verifica se o texto de exibição da barra de progresso está correto
    [Arguments]    ${expected_text}
    ${display}=    Get Text    ${PROGRESS_BAR_DISPLAY}
    Should Be Equal    ${display}    ${expected_text}

Progress Bar Should Be
    [Arguments]    ${expected_percent}

    ${translate}=    Get Translate Value    ${PROGRESS_BAR_INDICATOR}

    ${progress}=    Evaluate    100 + ${translate}
    ${progress}=    Convert To Integer    ${progress}
    Log    TranslateX: ${translate}%, Progresso calculado: ${progress}%, Esperado: ${expected_percent}%

    Should Be True    ${progress} == ${expected_percent}
    ...    msg=Barra em ${progress}%, esperado ${expected_percent}%
    Scroll To Element    ${PROGRESS_BAR}
    Take Screenshot

Wait For Progress Bar To Reach Value
    [Documentation]    Aguarda até a progress bar atingir o valor desejado ou timeout
    [Arguments]    ${expected_value}    ${timeout}=10s
    Wait Until Keyword Succeeds    ${timeout}    0.5s
    ...    Progress Bar Should Be    ${expected_value}
    Progress Bar Display Should Show    ${expected_value}%

Click To Start Progress Bar
    Click    ${BUTTON_START_PROGRESS}
