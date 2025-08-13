*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Download_Upload/download.keywords.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    FILES

Test Tags       upload_download    smoke


*** Test Cases ***
Upload File By Selector
    Perform Upload File By Selector    file.txt

Upload By Promisse
    Perform Upload File By Promisse    file.txt
