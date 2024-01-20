*** Settings ***
Documentation      This Suite tests the Login Page of SERVEREST: https://serverest.dev. Creating a fast and dinamic CRUD suite,
...                to run this test by comand line: robot -d results tests/api_users.robot.
Resource                ../resources/api_users.resource


*** Variables ***


*** Test Cases ***
Scenario 01 - POST - Successfully register a new user on the ServeRest API
    Create a new user
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=201
    Check if the user was registered correctly

Scenario 02 - POST ERROR - Register a new user already registered

    Create a new user
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=201
    Repeat the user Register                                       
    Check if API doesn't allow this next register

Scenario 03 - GET - Check new user data 
    Create a new user
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=201
    Check the new user data
    Verify the response data

Scenario 04 - PUT - Update a User data
    Create a new user
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=201
    Update a User data                                            ${email_aleat_test}    status_code=200
    Verify the Update response data

Scenario 05 - DELETE - Deleting a user registered
    Create a new user
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=201
    Deleting a user who was registered
    Check if the user was deleted
    
    