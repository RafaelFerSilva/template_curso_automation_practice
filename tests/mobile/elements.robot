*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Elements/elements.keywords.resource

Suite Setup     Run Keywords    Open The Test Automation Practice Site    is_mobile=True    AND
...                 Click On Card And Validate Navigation    ELEMENTS

Test Tags       mobile    elements    elements_mobile


*** Test Cases ***
Must have a basic buttons section on the elements screen
    Check If Basic Buttons Are Visible
    Validate If Button With Text Is Visible    Primário
    Click On Button By Text    Ghost

Should Not Be Possible Click On Disabled Button
    Check If Is Not Possible Click On Disabled Button

Should Be Possible To Validate Loading Button Behavior
    Click On Loading Button And Check Behavior
    Check If Success Toast Is Visible

Should Be Possible Validate Buttons With Icons Visibility
    Check If Buttons With Icons Are Visible

Should Be Possible To Show And Hide Dynamic Element
    Click On Button To Show Dynamic Element And Check If Dynamic Element Is Visible
    Click On Button To Hide Dynamic Element And Check If Dynamic Element Is Not Visible

Should Be Possible Disabled And Enabled Elements Form
    Check Elements Form States
    Validate Check Boxe Group States
    Validate Radio Button Group States
    Validate Swith Notification Button
    Validate Counter Buttons States

    Click On Disabled Form Button

    Check Elements Form States    disabled
    Validate Check Boxe Group States    disabled
    Validate Radio Button Group States    disabled
    Validate Swith Notification Button    disabled
    Validate Counter Buttons States    disabled

    [Teardown]    Click On Enabled Form Button

Should Be Possible Add Form Informations
    ${user_data}    Create A Faker User Data
    Input User Data On Elements Form    ${user_data}    resources/files/file.txt

Should Be Possíble Select CheckBoxes
    Perform Check On Check Box    1
    Validate Check Box Data State    2    unchecked
    Validate Check Box Data State    3    unchecked

    Perform Check On Check Box    3
    Perform Uncheck On Check Box
    Validate Check Box Data State    1    unchecked
    Validate Check Box Data State    2    unchecked

Should Be Possíble Select Radio Buttonss
    Perform Check On Radio Button    1
    Validate Radio Button Data State    2    unchecked
    Validate Radio Button Data State    3    unchecked

    Perform Check On Radio Button    3
    Validate Radio Button Data State    1    unchecked
    Validate Radio Button Data State    2    unchecked

Should Be Possible Move Slider
    Set Slider Value    75
    Set Slider Value    25

Should Be Possible Validade Progress Bar
    Click    data-testid=button-start-progress
    Wait For Progress Bar To Reach Value    100

Should Be Possible Update Counter
    Update Counter    10
    Update Counter    -15
    Update Counter    2
    Update Counter    2
    Update Counter    0
