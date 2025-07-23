*** Variables ***
${PRIMARY_BUTTON}                           //button[text()="Primário"]
${SECONDARY_BUTTON}                         //button[contains(@class, "bg-secondary")]
${OUTLINE_BUTTON}                           button >> text=Outline
${GHOST_BUTTON}                             //button[@data-testid="button-ghost"]
${LINK_BUTTON}                              data-testid=button-link
${DESTRUCTIVE_BUTTON}                       button.bg-destructive

${DISABLED_BUTTON}                          data-testid=button-disabled
${LOAD_BUTTON}=                             data-testid=button-loading
${TOAST-1}=                                 data-testid=toast-1
${TOAST-TITLE-1}                            data-testid=toast-title-1
${TOAST-DESCRIPTION-1}                      data-testid=toast-description-1

${BUTTON_PLAY}=                             data-testid=button-play >> text=Play >> svg.lucide-play
${BUTTON_PAUSE}=                            data-testid=button-pause >> text=Pause >> svg.lucide-pause
${BUTTON_STOP}=                             data-testid=button-stop >> text=Stop >> svg.lucide-square
${BUTTON_DOWNLOAD}=                         data-testid=button-download >> text=Download >> svg.lucide-download
${BUTTON_UPLOAD}=                           data-testid=button-upload >> text=Upload >> svg.lucide-upload

${BUTTON_SHOW}=                             data-testid=button-show
${BUTTON_HIDE}=                             data-testid=button-hide
${STATS_VALUE_DYNAMIC_ELEMENT}=             data-testid=stats-value-dynamic-element >> text=Este elemento pode ser ocultado/mostrado dinamicamente

${BUTTON_ENABLE}=                           data-testid=button-enable
${BUTTON_DISABLE}=                          data-testid=button-disable

${CARD_FORM_ELEMENTS}=                      data-testid=card-form-elements
${CARD_FORM_ELEMENTS_INPUT_TEXT}=           ${CARD_FORM_ELEMENTS} >> data-testid=input-text
${CARD_FORM_ELEMENTS_INPUT_EMAIL}=          ${CARD_FORM_ELEMENTS} >> data-testid=input-email
${CARD_FORM_ELEMENTS_INPUT_PASSWORD}=       ${CARD_FORM_ELEMENTS} >> data-testid=input-password
${CARD_FORM_ELEMENTS_INPUT_NUMBER}=         ${CARD_FORM_ELEMENTS} >> data-testid=input-number
${CARD_FORM_ELEMENTS_INPUT_DATE}=           ${CARD_FORM_ELEMENTS} >> data-testid=input-date
${CARD_FORM_ELEMENTS_INPUT_FILE}=           ${CARD_FORM_ELEMENTS} >> data-testid=input-file
${CARD_FORM_ELEMENTS_INPUT_TEXTAREA}=       ${CARD_FORM_ELEMENTS} >> data-testid=textarea-demo
${CARD_FORM_ELEMENTS_INPUT_SELECT}=         ${CARD_FORM_ELEMENTS} >> data-testid=select-demo

${CHECK_BOX_OPTION_1}=                      data-testid=checkbox-option1
${CHECK_BOX_OPTION_2}=                      data-testid=checkbox-option2
${CHECK_BOX_OPTION_3}=                      data-testid=checkbox-option3

${RADIO_OPTION_1}=                          data-testid=radio-option1
${RADIO_OPTION_2}=                          data-testid=radio-option2
${RADIO_OPTION_3}=                          data-testid=radio-option3

${SWITCH_NOTIFICATIONS}=                    data-testid=switch-notifications

${BUTTON_COUNTER_MINUS}=                    data-testid=button-counter-minus
${BUTTON_COUNTER_PLUS}=                     data-testid=button-counter-plus

${STATUS_VALUE_COUNTER}=                    data-testid=stats-value-counter-display

${SLIDER_DEMO}=                             data-testid=slider-demo
${SLIDER_TRUMB}=                            data-testid=slider-demo-thumb
${SLIDER_TRACK}=                            data-testid=slider-demo-track

${PROGRESS_BAR}=                            data-testid=progress-demo
${PROGRESS_BAR_INDICATOR}=                  data-testid=progress-demo-indicator
${PROGRESS_BAR_DISPLAY}=                    data-testid=stats-value-progress-display
${BUTTON_START_PROGRESS}=                   data-testid=button-start-progress
