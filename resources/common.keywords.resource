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
