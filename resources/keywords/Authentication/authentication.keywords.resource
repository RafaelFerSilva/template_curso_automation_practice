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
