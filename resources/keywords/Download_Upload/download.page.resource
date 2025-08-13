*** Settings ***
Library     Browser
Library     String
Resource    download.variables.resource


*** Keywords ***
Upload File Using Input
    [Arguments]    ${file_name}
    Upload File By Selector    ${UPLOAD_INPUT_FILE}    ${PROJECT_FILES_PATH}${file_name}

Upload File Using Promisse
    [Arguments]    ${file_name}
    ${promisse}=    Promise To Upload File    ${PROJECT_FILES_PATH}${file_name}
    Click    ${UPLOAD_BUTTON}
    ${upload_result}=    Wait For    ${promisse}

Check File Uploaded
    [Arguments]    ${file_name}
    ${element}=    Replace String    ${UPLOADED_FILE}    $$    ${file_name}
    Wait For Elements State    ${element}    visible

Click On Button To Download File
    [Arguments]    ${file_name}
    ${file}=    Replace String    ${FILES_TO_DOWNLOAD}    $$    ${file_name}
    Click    ${file}
