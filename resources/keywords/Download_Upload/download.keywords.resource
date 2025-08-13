*** Settings ***
Resource    download.page.resource


*** Keywords ***
Perform Upload File By Selector
    [Arguments]    ${file_name}
    Upload File Using Input    ${file_name}
    Check File Uploaded    ${file_name}

Perform Upload File By Promisse
    [Arguments]    ${file_name}
    Upload File Using Promisse    ${file_name}
    Check File Uploaded    ${file_name}
