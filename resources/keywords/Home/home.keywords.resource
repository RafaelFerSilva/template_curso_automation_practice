*** Settings ***
Resource    ${EXECDIR}/resources/common.keywords.resource
Resource    ${EXECDIR}/resources/keywords/Home/home.page.resource


*** Keywords ***
Validate If Home Page Is Displayed
    Validate Home Page Title
    Validate Home Page Description
    Validate If Cards Of Features Is Visible On Home Page

Open The Test Automation Practice Site
    [Arguments]    ${is_mobile}=False
    Open The Application    ${is_mobile}
    Validate If Home Page Is Displayed

Click On Card And Validate Navigation
    [Arguments]    ${card_key}
    Click On Card Button    ${card_key}
    Wait For Load State    domcontentloaded
    Validate Application Page URL    ${card_key}
    Validate Page Title    ${card_key}

Click on each of the cards on the home page and validate the title of the redirected page
    ${KEYS}=    Get Dictionary Keys    ${HOME_CARDS}
    FOR    ${card_key}    IN    @{KEYS}
        Click On Card And Validate Navigation    ${card_key}
        Go Back
    END
