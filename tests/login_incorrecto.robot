*** Settings ***
Documentation     Ejercicio 2 - Login incorrecto: se intenta iniciar sesion con credenciales
...               invalidas y se valida el mensaje de error mostrado por la aplicacion.
Resource          ../keywords/common.resource
Resource          ../keywords/login.resource
Test Setup        Abrir Navegador En    /login
Test Teardown     Cerrar Navegador
Force Tags        login    negativo


*** Test Cases ***
Login Con Credenciales Invalidas Muestra Error
    [Documentation]    Valida titulo y formulario de login, el mensaje de error y que no hay sesion.
    Validar Pagina De Login
    Ingresar Credenciales    ${EMAIL_INVALIDO}    ${CLAVE_INVALIDA}
    Validar Mensaje De Error De Login
    Capturar Pantalla    ej2_login_incorrecto
