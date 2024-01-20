*** Settings ***
Library             SeleniumLibrary
Library             RequestsLibrary
Resource            ../configs/config.resource
Resource            ../resources/page_objects.resource
Library             String



*** Keywords ***
Given I access the Login Page
    Wait Until Element Is Visible                ${logo_serverest_login}
When the form is subimited
    Input Text        ${form_email}     ${email_teste}
    Input Password    ${form_pw}        ${pw}
    Click Button      ${btn_enter}
Then the shopping page is displayed 
    Wait Until Element Is Visible    ${btn_home}
    Capture Element Screenshot       ${btn_home}
When the form is subimited with an Invalid Password
    Input Text        ${form_email}     ${email_teste}
    Input Password    ${form_pw}        ${wrong_pw}
    Click Button      ${btn_enter}
Then the Alert message "${email_senha_inv}" is displayed
    Wait Until Element Is Visible    //span[contains(.,'${email_senha_inv}')]
    Capture Element Screenshot    //span[contains(.,'${email_senha_inv}')]
 When the form is subimited with Email not registered  
    Input Text        ${form_email}     ${non_email}
    Input Password    ${form_pw}        ${pw}
    Click Button      ${btn_enter}
When I try to subimit the form with an invalid Email 
    Input Text        ${form_email}     ${inval_email}
    Input Password    ${form_pw}        ${pw}
    Click Button      ${btn_enter}
Then I get an Alert and I should remain in the ${login_info} page.
    Page Should Contain Element    //h1[@class='font-robot'][contains(.,'${login_info}')]  
When the form is subimited without a Password
    Input Text        ${form_email}     ${email_teste}
    Input Password    ${form_pw}         ${passw_blank}
    Click Button      ${btn_enter}
Then Blank Password alert message "${passw_blank_alert}" is displayed
    Wait Until Element Is Visible    //span[contains(.,'${passw_blank_alert}')]
When the form is subimited without an Email
    Input Text        ${form_email}     ${email_blank}
    Input Password    ${form_pw}        ${pw}
    Click Button      ${btn_enter}
Then Blank Email alert message "Email é obrigatório" is displayed
    Wait Until Element Is Visible    ${email_blank_alert}
When the form is subimited without any Email and Password
    Click Button      ${btn_enter}
Then Blank Email and Blank Password alert messages "${passw_blank_alert}" and "Email é obrigatório" are displayed
    Wait Until Element Is Visible           //span[contains(.,'Email é obrigatório')]
    Wait Until Element Is Visible           //span[contains(text(),'${passw_blank_alert}')]            
    