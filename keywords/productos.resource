*** Settings ***
Documentation     Keywords del escenario de busqueda de productos.
Library           SeleniumLibrary
Resource          ../variables/variables.resource
Resource          common.resource


*** Keywords ***
Validar Pagina De Productos
    [Documentation]    Comprueba que se cargo la pagina de productos con su buscador.
    Title Should Be    ${TITULO_PRODUCTOS}
    Element Should Be Visible    ${BUSCAR_CAJA}
    Page Should Contain Element    ${BUSCAR_BOTON}

Buscar Producto
    [Documentation]    Escribe un termino en el buscador y pulsa buscar.
    [Arguments]    ${termino}
    Input Text    ${BUSCAR_CAJA}    ${termino}
    Clic Seguro    ${BUSCAR_BOTON}

Validar Resultados De Busqueda
    [Documentation]    Comprueba que hay resultados y que corresponden al criterio buscado.
    [Arguments]    ${termino}    ${palabra}
    Wait Until Element Is Visible    ${BUSCAR_TITULO}
    Page Should Contain Element
    ...    xpath=//div[contains(@class,'features_items')]/h2[contains(translate(., 'SEARCHED PRODUCTS', 'searched products'), 'searched products')]
    ${productos}=    Get WebElements    ${BUSCAR_NOMBRES}
    ${cantidad}=    Get Length    ${productos}
    Should Be True    ${cantidad} > 0    La busqueda no devolvio productos
    Page Should Contain Element
    ...    xpath=//div[contains(@class,'productinfo')]/p[contains(translate(., 'SHIRT', 'shirt'), '${palabra}')]
    Location Should Contain    search=${termino}
