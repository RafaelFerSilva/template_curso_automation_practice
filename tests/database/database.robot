*** Settings ***
Resource        ${EXECDIR}/resources/keywords/Databse/DataBase.keywords.resource
Library         ${EXECDIR}/resources/libs/Dotenv.py

Test Tags       database


*** Test Cases ***
Connect Database
    Log To Console    %{MESSAGE}