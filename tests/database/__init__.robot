*** Settings ***

Resource        ${EXECDIR}/resources/keywords/Databse/DataBase.keywords.resource
Library         ${EXECDIR}/resources/libs/Dotenv.py

Suite Setup    Run Keywords
...    Set Environment Project Variables    environment=${ENVIRONMENT}    AND
...    Connect to application database

Suite Teardown    Disconnect From Database
