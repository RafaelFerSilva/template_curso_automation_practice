*** Settings ***
Documentation       This resource file contains common keywords and settings for browser automation.

Library             Browser
Library             Collections
Library             FakerLibrary    locale=pt_BR
Library             String
Variables           ${EXECDIR}/resources/config_variables.py


*** Keywords ***
Set Mobile context
    [Documentation]    Configures the browser context for a specific mobile device.
    ...
    ...    Uses the global variable DEVICE to get the device settings
    ...    and applies these settings to the browser context.

    ${device}=    Get Device    ${DEVICE}
    ${copy_new_context}=    Copy Dictionary    ${NEW_CONTEXT}    deepcopy=TRUE
    Set To Dictionary    ${copy_new_context}    &{device}
    New Context    &{copy_new_context}

Config New Context
    [Documentation]    Configures a new browser context based on the mobile device flag.
    ...
    ...    If MOBILE is true, configures a context for mobile device.
    ...    Otherwise, configures a default context using NEW_CONTEXT.

    IF    ${MOBILE}
        Set Mobile context
    ELSE
        New Context    &{NEW_CONTEXT}
    END

Open The Application
    [Documentation]    Opens the browser with settings defined in the NEW_CONTEXT object (config_variables.py).
    ...
    ...    Arguments:
    ...    - MOBILE: Flag to indicate if mobile configuration should be used (default: False)
    ...
    ...    Behavior:
    ...    - Opens a new browser with defined settings
    ...    - Configures appropriate context (mobile or desktop)
    ...    - Opens a new page with the defined URL
    [Arguments]    ${is_mobile}=False

    Set Suite Variable    ${MOBILE}    ${is_mobile}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    Config New Context
    New Page    /

Validate Page URL
    [Documentation]    Validates if the current page URL matches the expected resource.
    [Arguments]    ${expected_resource}
    Get Url    ==    ${BASE_URL}${expected_resource}

Validate If Button With Text Is Visible
    [Arguments]    ${button_text}
    Wait For Elements State    button >> text=${button_text}    visible

Click On Button By Text
    [Arguments]    ${button_text}    ${button}=left
    Click    button >> text=${button_text}    ${button}

Create A Faker User Data
    [Arguments]    ${user_identifier}=USER
    ${name}=    FakerLibrary.Name
    ${last_name}=    FakerLibrary.Last Name
    ${email}=    FakerLibrary.Email
    ${phone}=    FakerLibrary.Numerify    text=(##) ####-####
    ${cpf}=    FakerLibrary.CPF
    ${age}=    FakerLibrary.Date Of Birth    minimum_age=18    maximum_age=100
    ${gender}=    FakerLibrary.RandomElement    elements=["Masculino", "Feminino", "Outro", "Prefiro não dizer"]

    ${address}=    FakerLibrary.Address
    ${address}=    Replace String    ${address}    \n    ${EMPTY}
    ${city}=    FakerLibrary.City
    ${state}=    FakerLibrary.State
    ${zip}=    FakerLibrary.Numerify    text=#####-###

    ${card_number}=    FakerLibrary.Numerify    text=#### #### #### ####
    ${expiration_date}=    FakerLibrary.Credit Card Expire    date_format="%m/%y"
    ${cvv}=    FakerLibrary.Numerify    text=###
    ${password}=    FakerLibrary.Password

    ${number}=    FakerLibrary.Random Number    digits=2
    ${message}=    FakerLibrary.Text
    ${option}=    FakerLibrary.RandomElement    elements=["Opção 1", "Opção 2", "Opção 3", "Opção 4"]

    ${user_data}=    Create Dictionary
    ...    name=${name}
    ...    last_name=${last_name}
    ...    email=${email}
    ...    phone=${phone}
    ...    cpf=${cpf}
    ...    gender=${gender}
    ...    address=${address}
    ...    city=${city}
    ...    state=${state}
    ...    zip=${zip}
    ...    card_number=${card_number}
    ...    expiration_date=${expiration_date}
    ...    cvv=${cvv}
    ...    password=${password}
    ...    number=${number}
    ...    age=${age}
    ...    message=${message}
    ...    option=${option}

    Log Dictionary    ${user_data}

    Set Test Variable    ${${user_identifier}}    ${user_data}
    RETURN    ${user_data}

Create A Faker User With Invalid Data
    [Arguments]    ${user_identifier}=INVALID_USER

    ${name}=    FakerLibrary.Random Letter
    ${last_name}=    FakerLibrary.Random Letter
    ${email}=    FakerLibrary.Name
    ${phone}=    FakerLibrary.Numerify    text=(##) ####-###
    ${cpf}=    FakerLibrary.Numerify    text=###.###.##
    ${age}=    FakerLibrary.Date Of Birth    minimum_age=0    maximum_age=17
    ${gender}=    FakerLibrary.RandomElement    elements=["Masculino", "Feminino", "Outro", "Prefiro não dizer"]

    ${address}=    FakerLibrary.Paragraph
    ${city}=    FakerLibrary.Name
    ${state}=    FakerLibrary.State
    ${zip}=    FakerLibrary.Numerify    text=#####

    ${card_number}=    FakerLibrary.Numerify    text=#### #### #### ##
    ${expiration_date}=    FakerLibrary.Numerify    text=##/#
    ${cvv}=    FakerLibrary.Numerify    text=##
    ${password}=    FakerLibrary.Password    length=5

    ${number}=    FakerLibrary.Random Number    digits=2
    ${message}=    FakerLibrary.Text
    ${option}=    FakerLibrary.RandomElement    elements=["Opção 1", "Opção 2", "Opção 3", "Opção 4"]

    ${user_data}=    Create Dictionary
    ...    name=${name}
    ...    last_name=${last_name}
    ...    email=${email}
    ...    phone=${phone}
    ...    cpf=${cpf}
    ...    gender=${gender}
    ...    address=${address}
    ...    city=${city}
    ...    state=${state}
    ...    zip=${zip}
    ...    card_number=${card_number}
    ...    expiration_date=${expiration_date}
    ...    cvv=${cvv}
    ...    password=${password}
    ...    number=${number}
    ...    age=${age}
    ...    message=${message}
    ...    option=${option}

    Log Dictionary    ${user_data}

    Set Test Variable    ${${user_identifier}}    ${user_data}
    RETURN    ${user_data}

Type Date
    [Arguments]    ${data}    ${locator}
    ${day}=    Set Variable    ${data.day}
    ${month}=    Set Variable    ${data.month}
    ${year}=    Set Variable    ${data.year}

    IF    ${data.day} < 10
        ${day}=    Set Variable    0${data.day}
    END
    IF    ${data.month} < 10
        ${month}=    Set Variable    0${data.month}
    END

    Type Text    ${locator}    ${month}${day}${year}

Format String To Pattern
    [Documentation]    Formata uma string de acordo com o padrão esperado.
    ...    Exemplo: Format String To Pattern    20250723    {0}/{1}/{2}    4,2,2
    [Arguments]    ${input_string}    ${pattern}    ${split_sizes}

    @{sizes}=    Split String    ${split_sizes}    ,
    FOR    ${i}    IN RANGE    ${sizes.__len__()}
        ${sizes[${i}]}=    Convert To Integer    ${sizes[${i}]}
    END

    ${start}=    Set Variable    0
    @{parts}=    Create List
    FOR    ${size}    IN    @{sizes}
        ${end}=    Evaluate    ${start} + ${size}
        ${part}=    Evaluate    str(${input_string}[${start}:${end}])
        Append To List    ${parts}    ${part}
        ${start}=    Set Variable    ${end}
    END

    ${formatted}=    Evaluate    '''${pattern}'''.format(*${parts})
    RETURN    ${formatted}

Generate Xpath By Attribute
    [Documentation]    Generates an XPath locator based on the provided attribute, HTML element, and extension.
    [Arguments]    ${xpath_attribute}    ${html_element}=//input    ${xpath_extension}=//parent::div//p
    ${attr_pair}=    Set Variable    ${xpath_attribute}
    ${attr_name}    ${attr_value}=    Split String    ${attr_pair}    =
    ${xpath_locator}=    Set Variable    xpath=${html_element}\[@${attr_name}="${attr_value}"]${xpath_extension}
    RETURN    ${xpath_locator}

Get Translate Value
    [Arguments]    ${element}

    Sleep    2s

    ${style}=    Get Attribute    ${element}    style
    Log    Style completo: ${style}

    # Verifica se contém translateX
    Should Contain    ${style}    translateX(

    # Extrai o valor usando split
    @{parts}=    Split String    ${style}    translateX(
    ${right_part}=    Get From List    ${parts}    1
    @{value_parts}=    Split String    ${right_part}    %
    ${translate_str}=    Get From List    ${value_parts}    0
    ${translate_str}=    Replace String    ${translate_str}    )    ${EMPTY}
    ${translate}=    Convert To Number    ${translate_str}

    Log    Translate value: ${translate}
    RETURN    ${translate}

Verify Slider Value
    [Documentation]    Verifica se o slider está no valor esperado
    [Arguments]    ${locator_slider_trumb}    ${expected_value}    ${tolerance}=2

    # Aguarda um pouco para o valor se estabilizar
    Sleep    0.2s

    ${final_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuenow
    ${final_value}=    Convert To Number    ${final_value}
    ${difference}=    Evaluate    abs(${final_value} - ${expected_value})

    Log    Verificação - Valor final: ${final_value}, Esperado: ${expected_value}, Diferença: ${difference}

    Should Be True
    ...    ${difference} <= ${tolerance}
    ...    msg=Slider não chegou no valor esperado. Final: ${final_value}, Esperado: ${expected_value}, Diferença: ${difference}

Move Slider With Drag
    [Documentation]    Move o slider usando drag and drop no thumb
    [Arguments]
    ...    ${locator_slider_trumb}
    ...    ${locator_slider_track}
    ...    ${desired_value}
    ...    ${current_value}
    ...    ${min_value}
    ...    ${max_value}
    ...    ${tolerance}

    # Obtém as dimensões da track para calcular o movimento
    ${track_box}=    Get Bounding Box    ${locator_slider_track}
    ${track_width}=    Set Variable    ${track_box}[width]

    # Obtém a posição atual do thumb
    ${thumb_box}=    Get Bounding Box    ${locator_slider_trumb}

    # Calcula o offset necessário
    ${range_total}=    Evaluate    ${max_value} - ${min_value}
    ${current_percent}=    Evaluate    (${current_value} - ${min_value}) / ${range_total}
    ${desired_percent}=    Evaluate    (${desired_value} - ${min_value}) / ${range_total}

    ${current_pixel}=    Evaluate    ${track_width} * ${current_percent}
    ${desired_pixel}=    Evaluate    ${track_width} * ${desired_percent}
    ${offset}=    Evaluate    int(${desired_pixel} - ${current_pixel})

    Log    Drag Info - Track Width: ${track_width}, Offset: ${offset}px

    # Primeiro, foca no thumb para garantir que está ativo
    Scroll To Element    ${locator_slider_trumb}
    Focus    ${locator_slider_trumb}
    Sleep    0.1s

    # Executa o drag and drop
    Drag And Drop Relative To    ${locator_slider_trumb}    ${offset}    0
    Sleep    0.5s

    # Verifica se chegou no valor desejado
    Verify Slider Value    ${locator_slider_trumb}    ${desired_value}    ${tolerance}

Move Slider With Keys
    [Documentation]    Move o slider usando teclas de seta (mais preciso para ajustes finos)
    [Arguments]    ${locator_slider_trumb}    ${desired_value}    ${current_value}    ${tolerance}=1

    # Foca no slider thumb
    Scroll To Element    ${locator_slider_trumb}
    Focus    ${locator_slider_trumb}
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
        ${current}=    Get Attribute    ${locator_slider_trumb}    aria-valuenow
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
    [Arguments]    ${locator_slider_trumb}    ${locator_slider_track}

    ${current_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuenow
    ${min_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuemin
    ${max_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuemax

    ${track_box}=    Get Bounding Box    ${locator_slider_track}
    ${thumb_box}=    Get Bounding Box    ${locator_slider_trumb}

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
    [Arguments]    ${locator_slider_trumb}    ${locator_slider_track}    ${desired_value}    ${tolerance}=2

    # Aguarda o elemento estar visível e interagível
    Wait For Elements State    ${locator_slider_trumb}    visible    timeout=10s
    Wait For Elements State    ${locator_slider_trumb}    stable    timeout=5s

    # Obtém os valores atuais do slider
    ${current_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuenow
    ${min_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuemin
    ${max_value}=    Get Attribute    ${locator_slider_trumb}    aria-valuemax

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

    ${difference}=    Evaluate    abs(${desired_value} - ${current_value})
    IF    ${difference} <= ${tolerance}
        Log    Slider já está no valor desejado (diferença: ${difference})
        RETURN
    END

    # Estratégia 1: Drag and Drop no thumb
    ${success}=    Run Keyword And Return Status
    ...    Move Slider With Drag
    ...    ${locator_slider_trumb}
    ...    ${locator_slider_track}
    ...    ${desired_value}
    ...    ${current_value}
    ...    ${min_value}
    ...    ${max_value}
    ...    ${tolerance}

    IF    ${success}    RETURN

    # Estratégia 2: Teclas de seta
    ${success}=    Run Keyword And Return Status
    ...    Move Slider With Keys    ${desired_value}    ${current_value}    ${tolerance}

    Get Slider Debug Info    ${locator_slider_trumb}    ${locator_slider_track}

    IF    not ${success}
        Take Screenshot
        Fail    Não foi possível mover o slider para o valor desejado: ${desired_value}
    END

Progress Bar Should Be
    [Arguments]    ${locator_progress_indicator}    ${expected_percent}

    Scroll To Element    ${locator_progress_indicator}
    ${translate}=    Get Translate Value    ${locator_progress_indicator}

    ${progress}=    Evaluate    100 + ${translate}
    ${progress}=    Convert To Integer    ${progress}
    Log    TranslateX: ${translate}%, Progresso calculado: ${progress}%, Esperado: ${expected_percent}%

    Should Be True    ${progress} == ${expected_percent}
    ...    msg=Barra em ${progress}%, esperado ${expected_percent}%
    Take Screenshot

Wait For Progress Bar To Reach Value
    [Documentation]    Aguarda até a progress bar atingir o valor desejado ou timeout
    [Arguments]    ${locator_progress_indicator}    ${expected_value}    ${timeout}=10s
    Wait Until Keyword Succeeds    ${timeout}    0.5s
    ...    Progress Bar Should Be    ${locator_progress_indicator}    ${expected_value}

String Replace
    [Documentation]    Replaces occurrences of '$$' with corresponding strings.
    ...
    ...    Arguments:
    ...    - template: String containing the '$$' markers to be replaced
    ...    - replacement_strings: List of strings that will replace the '$$' markers
    ...
    ...    Returns:
    ...    - String with replaced markers
    ...
    ...    Example:
    ...    |    ${element}=    |    String Replace    |    ${template}    |    @{replace_strings} |
    ...
    ...    The *template* argument is a string that contains the $$ that we want to change to another string.
    ...    The *replacement_strings* argument can be a list of strings that will be placed in place of the $$ in the template
    [Arguments]    ${template}    @{replacement_strings}
    FOR    ${string}    IN    @{replacement_strings}
        ${string}=    Convert To String    ${string}
        ${template}=    Replace String    ${template}    $$    ${string}    count=1
    END
    RETURN    ${template}
