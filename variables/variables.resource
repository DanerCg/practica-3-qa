*** Settings ***
Documentation     Variables reutilizables: configuracion, datos de prueba, mensajes esperados y localizadores.


*** Variables ***
# --- Configuracion general ---
${BASE_URL}                   https://automationexercise.com
${BROWSER}                    chrome
${TIMEOUT}                    15s
${CHROME_OPTIONS}             add_argument("--window-size=1366,900");add_argument("--disable-notifications")
${SCREENSHOT_DIR}             ${CURDIR}${/}..${/}screenshots

# --- Titulos de pagina esperados ---
${TITULO_HOME}                Automation Exercise
${TITULO_LOGIN}               Automation Exercise - Signup / Login
${TITULO_PRODUCTOS}           Automation Exercise - All Products

# --- Datos de prueba: login incorrecto ---
${EMAIL_INVALIDO}             usuario.invalido@correo-falso.com
${CLAVE_INVALIDA}             ClaveIncorrecta123
${MENSAJE_ERROR_LOGIN}        Your email or password is incorrect!

# --- Datos de prueba: busqueda de productos ---
${TERMINO_BUSQUEDA}           Tshirt
${PALABRA_ESPERADA}           shirt

# --- Datos de prueba: suscripcion ---
${MENSAJE_EXITO_SUSCRIPCION}  You have been successfully subscribed!
${TITULO_SUSCRIPCION}         SUBSCRIPTION

# --- Localizadores: login ---
${LOGIN_TITULO}               xpath=//div[@class='login-form']/h2
${LOGIN_EMAIL}                css:input[data-qa='login-email']
${LOGIN_PASSWORD}             name:password
${LOGIN_BOTON}                xpath=//button[@data-qa='login-button']
${LOGIN_ERROR}                css:.login-form p[style*='color: red']

# --- Localizadores: busqueda de productos ---
${BUSCAR_CAJA}                id:search_product
${BUSCAR_BOTON}               id:submit_search
${BUSCAR_TITULO}              xpath=//div[contains(@class,'features_items')]/h2
${BUSCAR_NOMBRES}             css:.features_items .productinfo p

# --- Localizadores: suscripcion ---
${SUSC_EMAIL}                 id:susbscribe_email
${SUSC_BOTON}                 id:subscribe
${SUSC_TITULO}                xpath=//div[@class='single-widget']/h2
${SUSC_MENSAJE}               css:#success-subscribe .alert-success
