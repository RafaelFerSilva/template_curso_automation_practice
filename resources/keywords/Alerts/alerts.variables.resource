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
