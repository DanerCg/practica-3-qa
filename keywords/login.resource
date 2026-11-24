*** Settings ***
Documentation     Keywords del escenario de inicio de sesion.
Library           SeleniumLibrary
Resource          ../variables/variables.resource
Resource          common.resource


*** Keywords ***
Validar Pagina De Login
    [Documentation]    Comprueba que se cargo la pagina de login.
    Title Should Be    ${TITULO_LOGIN}
    Element Should Be Visible    ${LOGIN_TITULO}
    Element Should Contain    ${LOGIN_TITULO}    Login to your account

Ingresar Credenciales
    [Documentation]    Escribe correo y contrasena y pulsa Login.
    [Arguments]    ${email}    ${clave}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Password    ${LOGIN_PASSWORD}    ${clave}
    Clic Seguro    ${LOGIN_BOTON}

Validar Mensaje De Error De Login
    [Documentation]    Comprueba que se muestra el error y que no se inicio sesion.
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be    ${LOGIN_ERROR}    ${MENSAJE_ERROR_LOGIN}
    Page Should Contain    ${MENSAJE_ERROR_LOGIN}
    Page Should Not Contain    Logged in as
    Location Should Contain    /login
