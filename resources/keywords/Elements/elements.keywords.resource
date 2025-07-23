*** Settings ***
Resource    elements.page.resource


*** Keywords ***
Check If Basic Buttons Are Visible
    Validate if Basic Primary Button Is Visible
    Validate if Basic Secondary Button Is Visible
    Validate if Basic Outline Button Is Visible
    Validate if Basic Ghost Button Is Visible
    Validate if Basic Link Button Is Visible
    Validate if Basic Destructive Button Is Visible

Check If Is Not Possible Click On Disabled Button
    Check Disabled Button
    ${status}=    Run Keyword And Return Status    Click On Disabled Button
    Should Be Equal    ${status}    ${False}

Click On Loading Button And Check Behavior
    Check Loading Button    Simular Loading
    Click On Loading Button
    Check Loading Button    Carregando...
    Check Load Button State    disabled

Check If Success Toast Is Visible
    Check Loading Toast Title    Sucesso!
    Check Loading Toast Description    Operação completada com sucesso.

Check If Buttons With Icons Are Visible
    Check If Play Button Is Visible
    Check If Pause Button Is Visible
    Check If Stop Button Is Visible
    Check If Download Button Is Visible
    Check If Upload Button Is Visible

Click On Button To Show Dynamic Element And Check If Dynamic Element Is Visible
    Click On Button To Show Dynamic Element
    Check If Dynamic Element State

Click On Button To Hide Dynamic Element And Check If Dynamic Element Is Not Visible
    Click On Button To Hide Dynamic Element
    Check If Dynamic Element State    hidden

Check Elements Form States
    [Arguments]    ${state}=enabled
    Check Form Input Text    Digite seu nome    ${state}
    Check Form Input Email    ${state}
    Check Form Input Password    ${state}
    Check Form Input Number    ${state}
    Check Form Input Date    ${state}
    Check Form Input File    ${state}
    Check Form Input TextArea    ${state}
    Check Form Input Select    ${state}

Validate Check Boxe Group States
    [Arguments]    ${state}=enabled
    Validate Check Box State    1    ${state}
    Validate Check Box State    2    ${state}
    Validate Check Box State    3    ${state}

Validate Radio Button Group States
    [Arguments]    ${state}=enabled
    Validate Radio Button State    1    ${state}
    Validate Radio Button State    2    ${state}
    Validate Radio Button State    3    ${state}

Validate Counter Buttons States
    [Arguments]    ${state}=enabled
    Validate Counter Minus Button    ${state}
    Validate Counter Plus Button    ${state}

Input User Data On Elements Form
    [Arguments]    ${user_data}    ${file_path}
    Type User Name    ${user_data.name}
    Type User Email    ${user_data.email}
    Type User Password    ${user_data.password}
    Type User Number    ${user_data.number}
    Type User Age    ${user_data.age}
    Type User Message    ${user_data.message}
    Select User Option    ${user_data.option}
    Select User File    ${file_path}

Update Counter
    [Arguments]    ${expected_value}
    ${current_value}=    Get Text    ${STATUS_VALUE_COUNTER}

    IF    ${current_value} == ${expected_value}
        Log    Counter value ${current_value} matches the expected value: ${expected_value}
        RETURN
    END

    IF    ${current_value} > ${expected_value}
        ${diference}=    Evaluate    int(${current_value}) - int(${expected_value})
        Log    Current value ${current_value} is greater than the expected value: ${expected_value}
        FOR    ${i}    IN RANGE    ${diference}
            Click On Counter Minus Button
        END
    ELSE
        ${diference}=    Evaluate    int(${expected_value}) - int(${current_value})
        Log    Current value ${current_value} is less than the expected value: ${expected_value}
        FOR    ${i}    IN RANGE    ${diference}
            Click On Counter Plus Button
        END
    END

    ${current_value}=    Get Text    ${STATUS_VALUE_COUNTER}
    Should Be Equal As Numbers    ${current_value}    ${expected_value}
