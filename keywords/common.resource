*** Settings ***
Documentation     Keywords reutilizables comunes a todos los escenarios.
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Library           String
Resource          ../variables/variables.resource


*** Keywords ***
Abrir Navegador En
    [Documentation]    Abre el navegador en una ruta del sitio y lo deja listo para interactuar.
    [Arguments]    ${ruta}=/
    Open Browser    ${BASE_URL}${ruta}    ${BROWSER}    options=${CHROME_OPTIONS}
    Set Selenium Timeout    ${TIMEOUT}
    Aceptar Cookies Si Aparecen
    Quitar Anuncios
    Cerrar Pestanas Extra

Aceptar Cookies Si Aparecen
    [Documentation]    Acepta el aviso de cookies del sitio si aparece.
    ${aparece}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    css:button.fc-cta-consent    3s
    IF    ${aparece}
        Click Element    css:button.fc-cta-consent
    END

Quitar Anuncios
    [Documentation]    Elimina del DOM los bloques de anuncios que pueden tapar botones.
    Execute Javascript
    ...    document.querySelectorAll('ins.adsbygoogle, iframe[id^="aswift"], iframe[id^="google_ads"]').forEach(function(e){e.remove();});

Cerrar Pestanas Extra
    [Documentation]    Cierra pestanas abiertas por anuncios y vuelve a la principal.
    ${ventanas}=    Get Window Handles
    ${cantidad}=    Get Length    ${ventanas}
    IF    ${cantidad} > 1
        ${extras}=    Get Slice From List    ${ventanas}    1
        FOR    ${ventana}    IN    @{extras}
            Switch Window    ${ventana}
            Close Window
        END
        Switch Window    ${ventanas}[0]
    END

Clic Seguro
    [Documentation]    Hace clic en un elemento; si un anuncio lo tapa, limpia la pagina y reintenta.
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${ok}
        Quitar Anuncios
        Cerrar Pestanas Extra
        Scroll Element Into View    ${locator}
        Click Element    ${locator}
    END

Capturar Pantalla
    [Documentation]    Guarda una captura de pantalla en la carpeta screenshots/.
    [Arguments]    ${nombre}
    Cerrar Pestanas Extra
    ${carpeta}=    Normalize Path    ${SCREENSHOT_DIR}
    Create Directory    ${carpeta}
    Capture Page Screenshot    ${carpeta}${/}${nombre}.png

Capturar Pantalla De Fallo
    [Documentation]    Captura de pantalla con el nombre de la prueba que fallo.
    ${nombre}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Capturar Pantalla    FALLO_${nombre}

Cerrar Navegador
    [Documentation]    Teardown: si la prueba fallo guarda una captura y cierra el navegador.
    IF    '${TEST STATUS}' == 'FAIL'
        Run Keyword And Ignore Error    Capturar Pantalla De Fallo
    END
    Close All Browsers
