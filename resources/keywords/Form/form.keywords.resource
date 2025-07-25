*** Settings ***
Resource    form.page.resource


*** Keywords ***
Fill User Personal Information
    [Arguments]    ${user_data}

    Type Text On Form Input    FIRST_NAME    ${user_data.name}
    Type Text On Form Input    LAST_NAME    ${user_data.last_name}
    Type Text On Form Input    EMAIL    ${user_data.email}
    Type Text On Form Input    PHONE    ${user_data.phone}
    Type Text On Form Input    CPF    ${user_data.cpf}
    Type User Birthday    ${user_data.age}
    Select User Gender    ${user_data.gender}

Fill User Address
    [Arguments]    ${user_data}
    Type Text On Form Input    ADDRESS    ${user_data.address}
    Type Text On Form Input    CITY    ${user_data.city}
    Select User State    ${user_data.state}
    Type Text On Form Input    ZIP_CODE    ${user_data.zip}

Fill User Payment Information
    [Arguments]    ${user_data}
    Check To Send Payment Information
    Type Text On Form Input    CARD_NUMBER    ${user_data.card_number}
    Type Text On Form Input    EXPIRE_DATE    ${user_data.expiration_date}
    Type Text On Form Input    CVV    ${user_data.cvv}

Fill User Password
    [Arguments]    ${user_data}
    Type Text On Form Input    PASSWORD    ${user_data.password}
    Type Text On Form Input    CONFIRM_PASSWORD    ${user_data.password}

Fill User Data On Form
    [Arguments]    ${user_data}    ${wants_payment}=${True}

    Fill User Personal Information    ${user_data}
    Fill User Address    ${user_data}
    IF    ${wants_payment}    Fill User Payment Information    ${user_data}
    Fill User Password    ${user_data}

Submit Form
    Click On Form Submit Button
    Check If Success Toast Appears
