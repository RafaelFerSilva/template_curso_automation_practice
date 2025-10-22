*** Settings ***
Resource        ${EXECDIR}/resources/keywords/Databse/DataBase.keywords.resource
Library         ${EXECDIR}/resources/libs/Dotenv.py

Test Tags       database    smoke


*** Test Cases ***
Perform a database query
    ${result}=    Perform a database query    SHOW DATABASES;
    Log    ${result}

    ${result}=    Perform a database query    SELECT * FROM users;
    Log    ${result}

Return the contents of the sql local query file and perform the query in the database
    ${result}=    Return the contents of the sql local query file and perform the query in the database    users.sql
    Log    ${result}

Read sql file, replace values and perform query
    ${result1}=    Return the contents of the sql local query file and perform the query in the database
    ...    users_replace.sql
    ...    user1@example.com
    Log    ${result1}
    Should Be Equal As Strings    ${result1}[0][username]    user1

    ${result2}=    Return the contents of the sql local query file and perform the query in the database
    ...    users_replace.sql
    ...    user2@example.com
    Log    ${result2}
    Should Be Equal As Strings    ${result2}[0][username]    user2

    ${result3}=    Return the contents of the sql local query file and perform the query in the database
    ...    users_replace.sql
    ...    user3@example.com
    Log    ${result3}
    Should Be Equal As Strings    ${result3}[0][username]    user3
