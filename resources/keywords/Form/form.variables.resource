*** Variables ***
&{FORM}
...                 FIRST_NAME=data-testid=input-firstName
...                 LAST_NAME=data-testid=input-lastName
...                 EMAIL=data-testid=input-email
...                 PHONE=data-testid=input-phone
...                 CPF=data-testid=input-cpf
...                 BIRTHDAY=data-testid=input-birthday
...                 GENDER=data-testid=select-gender
...                 ADDRESS=data-testid=input-address
...                 CITY=data-testid=input-city
...                 STATE=data-testid=select-state
...                 ZIP_CODE=data-testid=input-zipCode
...                 WANTS_PAYMENT=data-testid=input-wantsPayment
...                 CARD_NUMBER=data-testid=input-cardNumber
...                 EXPIRE_DATE=data-testid=input-expiryDate
...                 CVV=data-testid=input-cvv
...                 PASSWORD=data-testid=input-password
...                 CONFIRM_PASSWORD=data-testid=input-confirmPassword
...                 CLEAN_FORM=data-testid=btn-cancel
...                 SUBMIT_BUTTON=data-testid=btn-submit
...                 FORM_TOAST=data-testid=toast-
...                 FORM_TOAST_TITLE=data-testid=toast-title-
...                 FORM_TOAST_DESCRIPTION=data-testid=toast-description-

&{FORM_ERRORS}
...                 FIRST_NAME=Deve ter pelo menos 2 caracteres
...                 LAST_NAME=Deve ter pelo menos 2 caracteres
...                 EMAIL=Email inválido
...                 PHONE=Formato: (11) 9999-9999
...                 CPF=Campo obrigatório
...                 BIRTHDAY=Campo obrigatório
...                 GENDER=Selecione um gênero
...                 ADDRESS=Campo obrigatório
...                 CITY=Campo obrigatório
...                 STATE=Campo obrigatório
...                 ZIP_CODE=Campo obrigatório
...                 WANTS_PAYMENT=data-testid=input-wantsPayment
...                 CARD_NUMBER=Campo obrigatório
...                 EXPIRE_DATE=Campo obrigatório
...                 CVV=Campo obrigatório
...                 PASSWORD=Campo obrigatório
...                 CONFIRM_PASSWORD=Campo obrigatório
