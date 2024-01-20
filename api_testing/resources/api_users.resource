*** Settings ***
Library            RequestsLibrary
Library            String
Library            Collections


*** Keywords ***
Create a new user
    ${email_init_aleat}        Generate Random String    length=5    chars=[LETTERS]
    ${email_init_aleat}        Convert To Lower Case     ${email_init_aleat}
    Set Test Variable          ${email_aleat_test}       ${email_init_aleat}@emailaleatorio.com
    Log                        ${email_aleat_test}

Register a new user who was Created into ServeRest API
    [Arguments]     ${nome}    ${email}        ${status_code}
    ${body_post}    Create Dictionary
    ...             nome=${nome}    
    ...             email=${email}    
    ...             password=12345   
    ...             administrador=true
    Log             ${body_post}

    Start session on ServeRest
    ${Response}    POST On Session    
    ...            alias=ServeRest     
    ...            url=/usuarios    
    ...            expected_status=201    
    ...            json=${body_post} 
    ...            expected_status=${status_code}
   
    Log            ${Response.json()}
    IF    ${Response.status_code} == 201
        Set Test Variable    ${user_ID}        ${Response.json()["_id"]}        
    END

   
    Set Test Variable    ${RESPONSE}        ${Response.json()}

Start session on ServeRest
    ${headers}         Create Dictionary    Accept=application/json              Content-Type=application/json
    Create Session    alias=ServeRest      url=https://serverest.dev              headers=${headers}
Check if the user was registered correctly
    Log                               ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${RESPONSE}     _id
Repeat the user Register
    Register a new user who was Created into ServeRest API        Teste QA da Silva    ${email_aleat_test}    status_code=400
    
Check if API doesn't allow this next register
    Dictionary Should Contain Item    ${RESPONSE}    message    Este email já está sendo usado

Check the new user data
    ${response_check}       GET On Session    alias=ServeRest    url=/usuarios/${user_ID}    expected_status=200     
    Set Test Variable      ${Check_Resp}    ${response_check.json()}
Verify the response data
    Log                    ${Check_Resp}
    Dictionary Should Contain Item    ${Check_Resp}    nome                Teste QA da Silva     
    Dictionary Should Contain Item    ${Check_Resp}    email               ${email_aleat_test}    
    Dictionary Should Contain Item    ${Check_Resp}    password            12345    
    Dictionary Should Contain Item    ${Check_Resp}    administrador       true    value
    Dictionary Should Contain Item    ${Check_Resp}    _id                ${user_ID}
Update a User data
    [Arguments]    ${email}   ${status_code}
    ${body_put}    Create Dictionary
    ...             nome=BELTRANO DE SOUZA
    ...             email=${email}    
    ...             password=12345   
    ...             administrador=true
    ${response_PUT}    PUT On Session        alias=ServeRest    url=/usuarios/${user_ID}    expected_status=200
...                    json=${body_put} 
...                    expected_status=${status_code}
    Set Test Variable    ${RESPONSE_PUT}     ${response_PUT.json()}  

Verify the Update response data
    Dictionary Should Contain Item    ${RESPONSE_PUT}    message    Registro alterado com sucesso
Deleting a user who was registered
    ${response_DELETE}    DELETE On Session     alias=ServeRest    url=/usuarios/${user_ID}    expected_status=200
    Set Test Variable    ${RESPONSE_DELETE}    ${response_DELETE.json()}
Check if the user was deleted
    Dictionary Should Contain Item    ${RESPONSE_DELETE}    message    Registro excluído com sucesso
