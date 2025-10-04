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

${CATEGORY_SELECT}=                 //button[@data-testid="select-product-category"]//following-sibling::select
${RATING_SELECT}=                   //button[@data-testid="select-product-rating"]//following-sibling::select

${TABLE_KEY}=                       //div[contains(@data-testid, "stats-value-product-name") and text()="$$"]
${TABLE_TD_VALUES}=                 ${TABLE_KEY}//ancestor::tr//td[contains(@data-testid, "$$") and text()="$$"]
${TABLE_ITEM_STATUS}=               ${TABLE_KEY}//ancestor::tr//div[contains(@data-testid, "status") and text()="$$"]
${TABLE_ITEM_BUTTONS}=              ${TABLE_KEY}//ancestor::tr//button[contains(@data-testid, "$$")]
