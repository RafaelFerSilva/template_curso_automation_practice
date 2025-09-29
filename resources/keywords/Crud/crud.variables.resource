*** Variables ***
${CREATE_PROD_BUTTON}=              data-testid=btn-add
${CREATE_PROD_MODAL}=               data-testid=modal-create

&{CREATE_PROD_FIELDS}=
...                                 NAME=data-testid=input-product-name
...                                 CATEGORY=data-testid=select-product-category
...                                 PRICE=data-testid=input-product-price
...                                 STOCK=data-testid=input-product-stock
...                                 BRAND=data-testid=input-product-brand
...                                 RATING=data-testid=select-product-rating
...                                 DESCRIPTION=data-testid=textarea-product-description

${CREATE_PROD_AVAILABLE_BUTTON}=    data-testid=switch-product-available
${CREATE_PROD_CANCEL_BUTTON}=       data-testid=btn-cancel
${CREATE_PROD_SALVE_BUTTON}=        data-testid=btn-save-product
