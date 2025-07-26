*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Form/form.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    is_mobile=True    AND
...                 Click On Card And Validate Navigation    FORMS    AND
...                 Create A Faker User Data

Test Tags       mobile    forms    forms_mobile


*** Test Cases ***
Should Be Possible Register A New User
    [Tags]    registration    smoke
    Fill User Data On Form    ${USER}
    Click On Form Submit Button
    Check If Success Toast Appears

Should Be Possible Register A New User - GHERKIN
    [Tags]    gherkin
    Given Fill User Data On Form    ${USER}
    When Click On Form Submit Button
    Then Check If Success Toast Appears

Should Be Possible Register A New User Without Payments Information
    [Tags]    no-payment    smoke
    Fill User Data On Form    ${USER}    wants_payment=False
    Click On Form Submit Button
    Check If Success Toast Appears

Should Be Possible Clean Form
    [Tags]    clean-form
    Fill User Data On Form    ${USER}
    Click On Form Clean Button
    Check If Form Is Empty

Should Display Error Messages For Mandatory Fields
    [Tags]    mandatory-fields
    Check To Send Payment Information
    Click On Form Submit Button
    Validate Mandatory Fields Error Messages

Should Display Error Messages For Format Fields
    [Tags]    format-fields
    [Setup]    Run Keywords    Open The Test Automation Practice Site    is_mobile=True    AND
    ...    Click On Card And Validate Navigation    FORMS    AND
    ...    Create A Faker User With Invalid Data

    Fill User Data On Form    ${INVALID_USER}
    Click On Form Submit Button
    Validate Format Fields Error Messages

Should Display Error Message If Password And Confirm Password Are Not Equal
    [Tags]    password-validation
    Type Text On Form Input    PASSWORD    ${USER.password}
    Type Text On Form Input    CONFIRM_PASSWORD    ${USER.password}1
    Click On Form Submit Button
    Validate Error Message When Passwords Is Not Equal
