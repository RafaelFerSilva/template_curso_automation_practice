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
    Fill User Data On Form    ${USER}
    Click On Form Submit Button
    Check If Success Toast Appears

Should Be Possible Register A New User - GHERKIN
    Given Fill User Data On Form    ${USER}
    When Click On Form Submit Button
    Then Check If Success Toast Appears

Should Be Possible Register A New User Without Payments Information
    Fill User Data On Form    ${USER}    wants_payment=False
    Click On Form Submit Button
    Check If Success Toast Appears

Should Be Possible Clean Form
    Fill User Data On Form    ${USER}
    Click On Form Clean Button
    Check If Form Is Empty
