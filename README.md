# Practica 3 - Robot Framework

Pruebas automatizadas sobre https://automationexercise.com con Robot Framework
y SeleniumLibrary.

## Ejercicios resueltos

| Ejercicio | Archivo | Validaciones |
|-----------|---------|--------------|
| 2 - Login incorrecto | `tests/login_incorrecto.robot` | Title Should Be, Element Should Be Visible, Element Text Should Be, Page Should Contain, Page Should Not Contain |
| 3 - Busqueda de productos | `tests/busqueda_productos.robot` | Title Should Be, Element Should Be Visible, Page Should Contain Element, Should Be True |
| 6 - Suscripcion | `tests/suscripcion.robot` | Title Should Be, Element Should Be Visible, Element Text Should Be, Page Should Contain |

## Estructura

```
robot_project/
├── tests/          # casos de prueba (.robot)
├── keywords/       # keywords reutilizables (.resource)
│   ├── common.resource       # navegador, anuncios, capturas, clics
│   ├── login.resource
│   ├── productos.resource
│   └── suscripcion.resource
├── variables/      # variables y localizadores
│   └── variables.resource
├── screenshots/    # capturas generadas por las pruebas
└── reports/        # report.html, log.html y output.xml
```

## Requisitos

- Python 3.10 o superior
- Google Chrome instalado
- Conexion a internet (Selenium Manager descarga el chromedriver solo)

## Instalacion y ejecucion (Windows)

```
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
robot --outputdir reports tests
```

Para ejecutar un solo escenario:

```
robot --outputdir reports tests/busqueda_productos.robot
```

## Resultados

- Capturas: carpeta `screenshots/`.
- Reportes: `reports/report.html` (resumen) y `reports/log.html` (detalle paso a paso).
- Si una prueba falla se guarda ademas `screenshots/FALLO_<prueba>.png`.

## Subir a Git

```
git init
git add .
git commit -m "Practica 3: Robot Framework"
git branch -M main
git remote add origin https://github.com/<usuario>/<repositorio>.git
git push -u origin main
```
