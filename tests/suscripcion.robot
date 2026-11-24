*** Settings ***
Documentation     Ejercicio 6 - Suscripcion: se registra un correo en el bloque SUBSCRIPTION
...               del pie de pagina y se valida el mensaje de exito.
Resource          ../keywords/common.resource
Resource          ../keywords/suscripcion.resource
Test Setup        Abrir Navegador En    /
Test Teardown     Cerrar Navegador
Force Tags        suscripcion


*** Test Cases ***
Suscripcion Por Correo Muestra Mensaje De Exito
    [Documentation]    Valida el titulo, el bloque de suscripcion y el mensaje de exito.
    ${marca}=    Get Time    epoch
    ${correo}=    Set Variable    estudiante${marca}@correo.com
    Validar Bloque De Suscripcion
    Suscribir Correo    ${correo}
    Validar Mensaje De Exito De Suscripcion
    Capturar Pantalla    ej6_suscripcion
