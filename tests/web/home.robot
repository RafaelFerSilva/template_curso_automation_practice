*** Settings ***
Documentation       This is test suite for home page

Resource            ${EXECDIR}/resources/common.keywords.resource
Resource            ${EXECDIR}/resources/keywords/Home/home.keywords.resource

Suite Setup         Open The Test Automation Practice Site


*** Test Cases ***
Should Be Possible To Navigate To Pages By Home Page Card
    Click on each of the cards on the home page and validate the title of the redirected page
