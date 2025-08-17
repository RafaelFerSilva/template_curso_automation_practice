*** Variables ***
${INPUT_LOGIN_EMAIL}=               data-testid=input-login-email
${INPUT_LOGIN_PASSWORD}=            data-testid=input-login-password
${BTN_SUBMIT_LOGIN}=                data-testid=btn-submit-login

${CARD_USER_DASHBOARD}=             data-testid=card-user-dashboard
${CARD_USER_NAME}=                  ${CARD_USER_DASHBOARD} >> data-testid=stats-value-user-name

${AUTH_LOGIN_TOAST}=                [data-testid^="toast-content"]
${AUTH_LOGIN_TOAST_TITLE}=          ${AUTH_LOGIN_TOAST} >> [data-testid^="toast-title-"]
${AUTH_LOGIN_TOAST_DESCRIPTION}=    ${AUTH_LOGIN_TOAST} >> [data-testid^="toast-description-"]
