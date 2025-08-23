*** Settings ***
Resource    authentication.page.resource


*** Keywords ***
Login With Credentials
    [Arguments]    ${user}
    Enter Value On Login E-mail Field    ${user}[email]
    Enter Value On Login Password Field    ${user}[password]
    Click    ${BTN_SUBMIT_LOGIN}
    Check User Name In User Dashboard    ${user}[name]

Input E-mail, Password And Click To Login
    [Arguments]    ${user}
    Enter Value On Login E-mail Field    ${user}[email]
    Enter Value On Login Password Field    ${user}[password]
    Click    ${BTN_SUBMIT_LOGIN}

Check Toast For Invalid Credentials
    Check Toast On Authentication    Credenciais inválidas    Tentativa 1 de 3. Verifique email e senha.

Add User Values On Registration Form
    [Arguments]    ${user}
    Enter Value On Input For Register User Name    ${user}[name]
    Enter Value On Input For Register User Email    ${user}[email]
    Enter Value On Input For Register User Password    ${user}[password]
    Enter Value On Input For Confirme Password    ${user}[password]
    Click On Register Button

Add Password Recovery Email And Submit
    [Arguments]    ${email}
    Input E-mail For Password Recovery    ${user}[email]
    Submit Password Recovery Request
