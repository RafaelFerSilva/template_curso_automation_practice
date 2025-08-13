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

Should Be Possible Download File
    [Tags]    download
    Click On Button And Wait Download Of File    Arquivo de Texto (.txt)    exemplo.txt
    Click On Button And Wait Download Of File    Planilha CSV (.csv)    dados.csv
    Click On Button And Wait Download Of File    Arquivo JSON (.json)    config.json
    Click On Button And Wait Download Of File    Arquivo de Log (.log)    log.log
    Click On Button And Wait Download Of File    Markdown (.md)    README.md
    Click On Button And Wait Download Of File    CSS (.css)    style.css
