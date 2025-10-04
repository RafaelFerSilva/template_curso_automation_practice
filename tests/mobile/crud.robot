*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Crud/crud.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    ${True}     AND
...                 Click On Card And Validate Navigation    CRUD

Test Tags       crud


*** Test Cases ***
Should Be Possible Register A Product
    [Tags]    create
    ${product}=    Create A Fake Product
    Register Product    ${product}
    Check If Register Success Toast Was Visible    Produto criado    ${product}[name] foi adicionado com sucesso.
    Check If The Product Was Registered On Table    ${product}
