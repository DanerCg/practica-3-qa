*** Settings ***
Documentation     Keywords del escenario de suscripcion por correo.
Library           SeleniumLibrary
Library           String
Resource          ../variables/variables.resource
Resource          common.resource


*** Keywords ***
Validar Bloque De Suscripcion
    [Documentation]    Baja al pie de pagina y comprueba que existe el bloque SUBSCRIPTION.
    Title Should Be    ${TITULO_HOME}
    Scroll Element Into View    ${SUSC_EMAIL}
    Element Should Be Visible    ${SUSC_TITULO}
    ${titulo}=    Get Text    ${SUSC_TITULO}
    ${titulo}=    Convert To Upper Case    ${titulo}
    Should Be Equal    ${titulo}    ${TITULO_SUSCRIPCION}

Suscribir Correo
    [Documentation]    Escribe un correo en el bloque de suscripcion y pulsa el boton.
    [Arguments]    ${correo}
    Input Text    ${SUSC_EMAIL}    ${correo}
    Clic Seguro    ${SUSC_BOTON}

Validar Mensaje De Exito De Suscripcion
    [Documentation]    Comprueba que aparece el mensaje de exito.
    Wait Until Element Is Visible    ${SUSC_MENSAJE}
    Element Text Should Be    ${SUSC_MENSAJE}    ${MENSAJE_EXITO_SUSCRIPCION}
    Page Should Contain    ${MENSAJE_EXITO_SUSCRIPCION}
