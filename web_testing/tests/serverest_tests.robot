*** Settings ***
Documentation         This Suite tests the Login Page of SERVEREST: https://front.serverest.dev/login, once a valid Email is already registered.
...                   to run this test by comand line:   robot -d results -i Login tests/serverest_tests.robot
Library               SeleniumLibrary
Library               RequestsLibrary
Resource              ../resources/serverest_resources.robot
Resource              ../configs/config.resource
Test Setup            New Session
Test Teardown         End Session



Library    SeleniumLibrary
*** Comments ***
Base business rule: Always, before the test runs a user should be registered, 
...    once each 10 min tha database is cleaned up.

*** Test Cases ***
Context
    [Documentation]     Certify the user is resgistered before happy path 
    [Tags]              Login    Login_Ok  email_register    ExcludeKeyword
    As a registered User, I want login into my Home page, For that I can shopping
CT-01 Login Successful
    [Documentation]     This test certify the correct Login from Serverest's Login page into the Product Page
    [Tags]            Login    Login_Ok    
    Given I access the Login Page
    When the form is subimited
    Then the shopping page is displayed    

CT-02 Invalid Password
    [Documentation]     This test certify that the login can't be done with a registered Email
    ...    but with an invalid Password
    [Tags]            Login    Login_Inv_Passw    
    Given I access the Login Page
    When the form is subimited with an Invalid Password
    Then the Alert message "Email e/ou senha inválidos" is displayed  
    
CT-03 Email Doesn't registered
    [Documentation]     This test certify that the login can't be done without a registered Email
    [Tags]            Login    Login_Email_Not_Reg    
    Given I access the Login Page
    When the form is subimited with Email not registered 
    Then the Alert message "Email e/ou senha inválidos" is displayed
CT-04 Invalid Email
    [Documentation]     This test certify that the login can't be done without a registered Email
    [Tags]            Login    Login_Inv_Email    
    Given I access the Login Page
    When I try to subimit the form with an invalid Email 
    Then I get an Alert and I should remain in the Login page.
CT-05 Login without Password
    [Documentation]     This test certify that the login can't be done even a valid Email,
    ...    but Without any Password
    [Tags]            Login    Login_WOt_Passw    
    Given I access the Login Page
    When the form is subimited without a Password
    Then Blank Password alert message "Password é obrigatório" is displayed
CT-06 Login without Email
    [Documentation]    This test certify that the login can't be done Without a Email
    [Tags]            Login    Login_WOt_Email    
    Given I access the Login Page
    When the form is subimited without an Email
    Then Blank Email alert message "Email é obrigatório" is displayed

CT-07 Login without Password and Email
    [Documentation]     This test certify that the login can't be done Without any data
    [Tags]            Login    Login_WOt_data    
    Given I access the Login Page
    When the form is subimited without any Email and Password
    Then Blank Email and Blank Password alert messages "Password é obrigatório" and "Email é obrigatório" are displayed
