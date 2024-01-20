*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${logo_serverest_login}                    (//div//form//img[@class='imagem'])
${form_email}                              email
${form_pw}                                 password
${btn_enter}                                //button[@data-testid='entrar'][contains(.,'Entrar')]
${btn_home}                                //a[@data-testid='home'][contains(.,'Home')]
${wrong_pw}                                abcd
${non_email}                               email_nao_regis@gmail.com
${inval_email}                             123.com
${email_blank_alert}                       //div//span[contains(.,'Email é obrigatório')]
${passw_blank}                               
${email_blank}           
${login_info}                              //h1[@class='font-robot'][contains(.,'Login')]       