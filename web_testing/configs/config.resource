*** Settings ***
Resource                    ../resources/page_objects.resource
Library                     SeleniumLibrary
Library                     RequestsLibrary
Library                     String

*** Variables ***
${url}              https://front.serverest.dev/login
${timeout}	        3
${pw}               1234t
${browser_chr}      chrome
${browser_hl}       Headless Chrome

*** Keywords ***
# Global and General Steps
New Session 
    ${tags}=    Set Variable    ${TEST_TAGS}
    Run Keyword If    'ExcludeKeyword' not in ${TEST_TAGS}     Actual Setup Keyword

Actual Setup Keyword
    Log    Running Test Setup

    
    Open Browser    ${url}    browser=${browser_chr}
    Maximize Browser Window
End Session
    ${tags}=    Set Variable    ${TEST_TAGS}
    Run Keyword If    'ExcludeKeyword' not in ${TEST_TAGS}    Actual Teardown Keyword

Actual Teardown Keyword
    Log    Running Test Teardown

    Capture Page Screenshot
    Close Browser

As a registered User, I want login into my Home page, For that I can shopping
    #THIS COMMAND IS NOT A TEST, JUST A SET BEFORE TESTS, SPECIALLY HAPPY PATH
    ${base_aleat}         Generate Random String    length=5    chars=[LETTERS]
    Set Global Variable     ${email_teste}            ${base_aleat}@qa.com.br

    Create Session    alias=serve_rest    url=https://serverest.dev
    ${header}      Create Dictionary    Content-Type=application/json
    ${Response}    POST On Session    alias=serve_rest    url=/usuarios    expected_status=201    headers=${header}    data={"nome": "Teste da Silva", "email": "${email_teste}", "password": "1234t", "administrador": "true"}
    Log            ${Response.json()} been as random email: ${email_teste}