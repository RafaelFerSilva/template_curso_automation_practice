*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Crud/crud.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    CRUD

Test Tags       crud


*** Test Cases ***
Should Be Possible Register A Product
    [Tags]    create
    ${product}=    Create A Fake Product
    Register Product    ${product}
    Check If Toast Was Visible    Produto criado    ${product}[name] foi adicionado com sucesso.
    Check If The Product Was Registered On Table    ${product}

Should Be Possible Update A Product
    [Tags]    update
    ${product}=    Register a random product

    ${product}[stock]=    FakerLibrary.Random Number    3

    Click On Table Row Button    ${product}[name]    edit
    Input Value On Update Product Form Field    STOCK    ${product}[stock]
    Click On Button To Save Updated Product
    Check If Toast Was Visible    Produto atualizado    ${product}[name] foi atualizado com sucesso.
    Check If The Product Was Registered On Table    ${product}

Should Be Possible Delete A Product
    [Tags]    delete
    ${product}=    Register a random product

    Click On Table Row Button    ${product}[name]    delete
    Confirm Deletion    ${product}[name]
    Check Table Row Value    ${product}[name]    name    ${product}[name]    hidden