*** Settings ***
Resource        ${EXECDIR}/resources/common.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Home/home.keywords.resource
Resource        ${EXECDIR}/resources/keywords/Authentication/authentication.page.resource

Test Setup      Run Keywords    Open The Test Automation Practice Site    AND
...                 Click On Card And Validate Navigation    AUTH

Test Tags       authentication


*** Test Cases ***
Read Json And Return Users By Role
    ${json_data}=    Load User Json File
    Log Many    ${json_data}[users]
    Read Json And Return Users By Role    admin
    Read Json And Return Users By Role    user
    Read Json And Return Users By Role    demo

Read Json And Return user By E-mail
    ${admin}=    Read Json And Return User By E-mail    admin@test.com
    Log Many    ${admin}
    ${demo}=    Read Json And Return User By E-mail    demo@test.com
    Log Many    ${demo}
