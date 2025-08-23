*** Variables ***
${INPUT_LOGIN_EMAIL}=                   data-testid=input-login-email
${INPUT_LOGIN_PASSWORD}=                data-testid=input-login-password
${BTN_SUBMIT_LOGIN}=                    data-testid=btn-submit-login

${CARD_USER_DASHBOARD}=                 data-testid=card-user-dashboard
${CARD_USER_NAME}=                      ${CARD_USER_DASHBOARD} >> data-testid=stats-value-user-name

${AUTH_LOGIN_TOAST}=                    [data-testid^="toast-content"]
${AUTH_LOGIN_TOAST_TITLE}=              ${AUTH_LOGIN_TOAST} >> [data-testid^="toast-title-"]
${AUTH_LOGIN_TOAST_DESCRIPTION}=        ${AUTH_LOGIN_TOAST} >> [data-testid^="toast-description-"]

${TABS_TRIGGER_AUTH_LOGIN}=             data-testid=tabs-trigger-auth-login
${TABS_TRIGGER_AUTH_REGISTER}=          data-testid=tabs-trigger-auth-register
${TABS_TRIGGER_AUTH_RESET}=             data-testid=tabs-trigger-auth-reset
${INPUT_REGISTER_NAME}=                 data-testid=input-register-name
${INPUT_REGISTER_EMAIL}=                data-testid=input-register-email
${INPUT_REGISTER_PASSWORD}=             data-testid=input-register-password
${INPUT_CONFIRM_PASSWORD}=              data-testid=input-register-confirm-password
${BTN_SUBMIT_REGISTER}=                 data-testid=btn-submit-register

${INPUT_PASSWORD_RECOVERY_EMAIL}=       data-testid=input-reset-email
${BTN_SUBMIT_RESET_PASSWORD}=           data-testid=btn-submit-reset-password
