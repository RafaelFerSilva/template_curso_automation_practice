*** Settings ***
Library     OperatingSystem
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

Click On Button And Wait Download Of File
    [Arguments]    ${button}    ${file_name}
    ${dl_promise}    Promise To Wait For Download    ${EXECDIR}/download/${file_name}
    Click On Button To Download File    ${button}
    ${file_obj}    Wait For    ${dl_promise}
    File Should Exist    ${file_obj}[saveAs]
    Should Be Equal As Strings    ${file_obj.suggestedFilename}    ${file_name}
