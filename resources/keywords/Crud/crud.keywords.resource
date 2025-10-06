*** Settings ***
Resource    ${EXECDIR}/resources/common.keywords.resource
Resource    crud.page.resource
Resource    ${EXECDIR}/resources/keywords/Alerts/alerts.page.resource


*** Keywords ***
Register Product
    [Arguments]    ${product}
    Click On Button To Create Product

    Input Value On Create Product Form Field    NAME    ${product}[name]
    Input Value On Create Product Form Field    PRICE    ${product}[price]
    Input Value On Create Product Form Field    STOCK    ${product}[stock]
    Input Value On Create Product Form Field    BRAND    ${product}[brand]
    Input Value On Create Product Form Field    DESCRIPTION    ${product}[description]
    Select Category    ${product}[category]
    Select Rating    ${product}[rating]
    Select Product Availability    ${product}[availability]

    Click On Button To Salve Product

Check If Toast Was Visible
    [Arguments]    ${title}    ${description}    ${state}=visible    ${timeout}=10s
    Check If Toast Notification Title Is Visible    ${title}    ${state}    ${timeout}
    Check If Toast Notification Description Is Visible    ${description}    ${state}    ${timeout}

Check Product Price On Table
    [Arguments]    ${product}

    ${price}=    Convert To Number    ${product}[price]    precision=2
    ${price_formatted}=    Format String    {:.2f}    ${price}
    Check Table Row Value    ${product}[name]    price    ${price_formatted}

Check If The Product Was Registered On Table
    [Arguments]    ${product}

    Check Table Row Value    ${product}[name]    category    ${product}[category]
    Check Product Price On Table    ${product}
    Check Table Row Value    ${product}[name]    stock    ${product}[stock]

    Check Table Row Status    ${product}[name]    ${product}[availability]

Register a random product
    ${product}=    Create A Fake Product
    Register Product    ${product}
    Check If Toast Was Visible    Produto criado    ${product}[name] foi adicionado com sucesso.
    Check If Toast Was Visible    Produto criado    ${product}[name] foi adicionado com sucesso.    hidden
    Check If The Product Was Registered On Table    ${product}
    RETURN    ${product}
