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

Progress Bar Display Should Show
    [Documentation]    Verifica se o texto de exibição da barra de progresso está correto
    [Arguments]    ${expected_text}
    ${display}=    Get Text    ${PROGRESS_BAR_DISPLAY}
    Should Be Equal    ${display}    ${expected_text}

Click To Start Progress Bar
    Click    ${BUTTON_START_PROGRESS}
