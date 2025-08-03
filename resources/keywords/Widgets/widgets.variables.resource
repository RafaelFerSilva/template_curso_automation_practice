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

${SORTABLE_ZONE}=                   [data-testid="stats-value-sortable-zone"]
${SORTABLE_ITEM}=                   data-testid=stats-value-sortable-item-

${DROP_ZONE}=                       [data-testid="stats-value-drop-zone"]
${DROPPED_ITEM}=                    data-testid=stats-value-dropped-item-

${DROPPED_DRAGGABLE_ITEM}=          ${DROP_ZONE} >> div[draggable="true"]
${SORTED_DRAGGABLE_ITEM}=           ${SORTABLE_ZONE} >> div[draggable="true"]

${BTN_EDIT_TOGGLE_VISIBILITY}=      data-testid=btn-edit-toggle-visibility
${DYNAMIC_ELEMENT}=                 data-testid=stats-value-dynamic-element

${BTN_TOGGLE_EXPAND}=               data-testid=btn-edit-toggle-expand
${EXPANDABLE_CONTENT}=              div[data-testid="stats-value-expandable-content"].opacity-$$ p

${TABS_BTN}=                        [data-testid="tabs-trigger-tab-$$"]
${TAB_CONTENT}=                     [data-testid="tabs-content-tab-$$"]
