*** Settings ***
Documentation       This is my first test with Robot Framework

Library             Browser


*** Variables ***
${BASE_URL}     https://test-automation-practice.com.br/
${BROWSER}      chromium
${HEADLESS}     True
${VIEWPORT}=    {'width': 1920, 'height': 1080}


*** Test Cases ***
Should be possible to open the site and verify the title
    Open the Test Automation Practice Site


*** Keywords ***
Open the Test Automation Practice Site
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport=${VIEWPORT}
    New Page    ${BASE_URL}
    Get Title    ==    Test Automation Practice - Plataforma Completa de Automação
