*** Variables ***
${PROJECT_FILES_PATH}=                  ${EXECDIR}/resources/files/
${UPLOAD_BUTTON}=                       data-testid=btn-primary-select-files
${UPLOAD_INPUT_FILE}=                   data-testid=input-file-input

${UPLOADED_FILE}=                       //p[contains(@data-testid, "stats-value-file-name-") and text()="$$"]//ancestor::div[contains(@data-testid,"stats-value-file-")]
${UPLOADED_FILE_BADGE}=                 ${UPLOADED_FILE}//div[contains(@data-testid,"badge-file-completed-")]
${BUTTON_TO_DOWNLOAD_UPLOADED_FILE}=    ${UPLOADED_FILE}//button[contains(@data-testid,"btn-edit-download-")]
${BUTTON_TO_REMOVE}                     ${UPLOADED_FILE}//button[contains(@btn-delete-remove-")]
