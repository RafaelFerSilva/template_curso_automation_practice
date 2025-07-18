*** Settings ***
Documentation       This is test suite for home page

Resource            ${EXECDIR}/resources/common.keywords.resource
Resource            ${EXECDIR}/resources/keywords/Home/home.keywords.resource

Suite Setup         Open the Test Automation Practice Site


*** Test Cases ***
Should be possible to open the site on the home page
    Validate If Home Page Is Displayed
