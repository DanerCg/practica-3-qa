*** Settings ***
Documentation     Ejercicio 3 - Busqueda de productos: se ingresa a la seccion de productos,
...               se realiza una busqueda y se valida que los resultados sean correctos.
Resource          ../keywords/common.resource
Resource          ../keywords/productos.resource
Test Setup        Abrir Navegador En    /products
Test Teardown     Cerrar Navegador
Force Tags        productos    busqueda


*** Test Cases ***
Busqueda De Producto Devuelve Resultados Correctos
    [Documentation]    Valida la pagina de productos, el titulo de resultados, que haya productos
    ...                y que alguno corresponda al criterio buscado.
    Validar Pagina De Productos
    Buscar Producto    ${TERMINO_BUSQUEDA}
    Validar Resultados De Busqueda    ${TERMINO_BUSQUEDA}    ${PALABRA_ESPERADA}
    Capturar Pantalla    ej3_busqueda_productos
