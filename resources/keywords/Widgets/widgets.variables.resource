*** Variables ***
${CAROUSEL_MAIN}=                   data-testid=carousel-main

&{CAROUSEL}=                        ITEM=data-testid=carousel-item-main-$$
...                                 PREV=data-testid=carousel-prev-main
...                                 NEXT=data-testid=carousel-next-main
...                                 AUTO=data-testid=btn-primary-auto-play
...                                 RESET=data-testid=btn-edit-reset-carousel
...                                 DOT=[data-testid="btn-edit-dot-$$"]

${CAROUSEL_DOTS}=                   [data-testid^="btn-edit-dot"]

${BADGE_SLIDER_DISPLAY}=            data-testid=badge-slider-display
${SLIDER_MAIN}=                     data-testid=slider-main
${SLIDER_MAIN_THUMB}=               data-testid=slider-main-thumb
${SLIDER_MAIN_TRACK}=               data-testid=slider-main-track

${BTN_EDIT_MUTE}=                   data-testid=btn-edit-mute
${BADGE_VOLUME_DISPLAY}=            data-testid=badge-volume-display
${SLIDER_VOLUME}=                   data-testid=slider-volume
${SLIDER_VOLUME_TRACK}=             data-testid=slider-volume-track
${SLIDER_VOLUME_THUMB}=             data-testid=slider-volume-thumb

${BTN_PRIMARY_START_PROGRESS}=      data-testid=btn-primary-start-progress
${PROGRESS_MAIN}=                   data-testid=progress-main
${PROGRESS_MAIN_INDICATOR}=         data-testid=progress-main-indicator
