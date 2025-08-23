*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Authentication/authentication.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    ${True}    AND
...                 Click On Card And Validate Navigation    AUTH

Test Tags       authentication


*** Test Cases ***
Read Json And Return Users By Role
    ${json_data}=    Load User Json File
    Log Many    ${json_data}[users]
    Read Json And Return Users By Role    admin
    Read Json And Return Users By Role    user
    Read Json And Return Users By Role    demo

Read Json And Return user By E-mail
    ${admin}=    Read Json And Return User By E-mail    admin@test.com
    Log Many    ${admin}
    ${demo}=    Read Json And Return User By E-mail    demo@test.com
    Log Many    ${demo}

Should Be Possible Login With Admin User
    [Tags]    admin    smoke
    ${admin}=    Read Json And Return User By E-mail    admin@test.com
    Login With Credentials    ${admin}

Should Be Possible Login With User
    [Tags]    user    smoke
    ${user}=    Read Json And Return User By E-mail    user@test.com
    Login With Credentials    ${user}

Should Be Possible Login With Demo User
    [Tags]    demo    smoke
    ${demo}=    Read Json And Return User By E-mail    demo@test.com
    Login With Credentials    ${demo}

Should Not Be Possible Login With Unregistered User
    ${unregistered}=    Read Json And Return User By E-mail    no_user@test.com
    Input E-mail, Password And Click To Login    ${unregistered}
    Check Toast For Invalid Credentials

Should Be Possible Register New User
    [Tags]    registration_new_user    smoke
    ${user}=    Create A Faker User Data
    Select Registration Form Tab    Cadastro
    Add User Values On Registration Form    ${user}
    Check Toast On Authentication    Cadastro realizado    Bem-vindo, ${user}[name]
    Check User Name In User Dashboard    ${user}[name]

Should Be Possible To Send Password Recovery Email
    [Tags]    password_recovery    smoke
    ${user}=    Create A Faker User Data
    Select Registration Form Tab    Recuperar
    Add Password Recovery Email And Submit    ${user}[email]
    Check Toast On Authentication
    ...    Email de recuperação enviado
    ...    Verifique sua caixa de entrada para redefinir sua senha.
