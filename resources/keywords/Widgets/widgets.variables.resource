*** Variables ***
${CAROUSEL_MAIN}=       data-testid=carousel-main

&{CAROUSEL}=            ITEM=data-testid=carousel-item-main-$$
...                     PREV=data-testid=carousel-prev-main
...                     NEXT=data-testid=carousel-next-main
...                     AUTO=data-testid=btn-primary-auto-play
...                     RESET=data-testid=btn-edit-reset-carousel
...                     DOT=[data-testid="btn-edit-dot-$$"]

${CAROUSEL_DOTS}=       [data-testid^="btn-edit-dot"]
