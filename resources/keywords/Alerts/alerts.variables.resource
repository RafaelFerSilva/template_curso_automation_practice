*** Variables ***
${STATIC_ALERT_INFORMATION}=                data-testid=alert-info
${STATIC_ALERT_SUCCESS}=                    data-testid=alert-success
${STATIC_ALERT_WARNING}=                    data-testid=alert-warning
${STATIC_ALERT_ERROR}=                      data-testid=alert-error

&{STATIC_ALERTS_TITLES}
...                                         STATIC_ALERT_INFORMATION=${STATIC_ALERT_INFORMATION} >> data-testid=alert-title-info >> text=$$
...                                         STATIC_ALERT_SUCCESS=${STATIC_ALERT_SUCCESS} >> data-testid=alert-title-success >> text=$$
...                                         STATIC_ALERT_WARNING=${STATIC_ALERT_WARNING} >> data-testid=alert-title-warning >> text=$$
...                                         STATIC_ALERT_ERROR=${STATIC_ALERT_ERROR} >> data-testid=alert-title-error >> text=$$

&{STATIC_ALERTS_DESCRIPTIONS}
...                                         STATIC_ALERT_INFORMATION=${STATIC_ALERT_INFORMATION} >> data-testid=alert-description-info >> text=$$
...                                         STATIC_ALERT_SUCCESS=${STATIC_ALERT_SUCCESS} >> data-testid=alert-description-success >> text=$$
...                                         STATIC_ALERT_WARNING=${STATIC_ALERT_WARNING} >> data-testid=alert-description-warning >> text=$$
...                                         STATIC_ALERT_ERROR=${STATIC_ALERT_ERROR} >> data-testid=alert-description-error >> text=$$

${TOAST_NOTIFICATION_SUCCESS_BUTTON}=       data-testid=btn-primary-toast-success >> text=$$
${TOAST_NOTIFICATION_WARNING_BUTTON}=       data-testid=btn-primary-toast-warning >> text=$$
${TOAST_NOTIFICATION_ERRO_BUTTON}=          data-testid=btn-primary-toast-error >> text=$$
${TOAST_NOTIFICATION_INFO_BUTTON}=          data-testid=btn-primary-toast-info >> text=$$

${TOAST_NOTIFICATION}=                      [data-testid^="toast-"]
${TOAST_NOTIFICATION_TITLE}=                ${TOAST_NOTIFICATION} >> [data-testid^="toast-title-"] >> text=$$
${TOAST_NOTIFICATION_DESCRIPTION}=          ${TOAST_NOTIFICATION} >> [data-testid^="toast-description-"] >> text=$$

${TOAST_NOTIFICATION_CLOSE_BUTTON}=         ${TOAST_NOTIFICATION} >> button >> [data-testid^="toast-close"]

${BROWSER_ALERT_BUTTON}=                    data-testid=btn-secondary-browser-alert
${BROWSER_CONFIRM_BUTTON}=                  data-testid=btn-secondary-browser-confirm
${BROWSER_PROMPT_BUTTON}=                   data-testid=btn-secondary-browser-prompt

${SIMPLE_MODAL_BUTTON}=                     data-testid=btn-primary-open-modal
${DELETE_MODAL_BUTTON}=                     data-testid=btn-delete-open-confirm
${FORM_MODAL_BUTTON}=                       data-testid=btn-primary-open-form-modal
${TEMP_ALERT_MODAL_BUTTON}=                 data-testid=btn-primary-timed-alert
${DINAMIC_MODAL_BUTTON}=                    data-testid=btn-primary-auto-dismiss

${SIMPLE_MODAL}=                            data-testid=modal-simple
&{SIMPLE_MODAL_COMPONENTE}=                 TITLE=${SIMPLE_MODAL} >> data-testid=dialog-title
...                                         DESCRIPTION=${SIMPLE_MODAL} >> data-testid=dialog-description-simple
...                                         STATUS=${SIMPLE_MODAL} >> data-testid=stats-value-modal-open-count
...                                         BUTTON=${SIMPLE_MODAL} >> data-testid=btn-close

${DELETE_MODAL}=                            data-testid=alert-dialog-content
&{DELETE_MODAL_COMPONENTE}=                 TITLE=${DELETE_MODAL} >> data-testid=alert-dialog-title
...                                         DESCRIPTION=${DELETE_MODAL} >> data-testid=alert-dialog-description
...                                         CANCEL=${DELETE_MODAL} >> data-testid=alert-dialog-cancel
...                                         CONFIRM=${DELETE_MODAL} >> data-testid=alert-dialog-action

${MODAL_FORM}=                              data-testid=modal-form
&{MODAL_FORM_COMPONENT}=                    TITLE=${MODAL_FORM} >> data-testid=dialog-title
...                                         DESCRIPTION=${MODAL_FORM} >> data-testid=dialog-description-form
...                                         NAME=${MODAL_FORM} >> data-testid=input-modal-name
...                                         EMAIL=${MODAL_FORM} >>data-testid=input-modal-email
...                                         MENSAGEM=${MODAL_FORM} >> data-testid=textarea-modal-message
...                                         CANCEL=${MODAL_FORM} >> data-testid=btn-cancel
...                                         CONFIRM=${MODAL_FORM} >> data-testid=btn-submit-form-modal

${ALERT_AUTO_DISMISS}=                      data-testid=alert-auto-dismiss >> span >> text=$$
