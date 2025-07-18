*** Settings ***
Resource    ${EXECDIR}/resources/keywords/Home/home.page.resource


*** Keywords ***
Validate If Home Page Is Displayed
    Validate Home Page Title
    Validate Home Page Description
    Validate If Cards Of Features Is Visible On Home Page
