Aquí tienes el texto formateado con Markdown:

```markdown
# Innovacion_Datos_2024
## GRUPO 9

### Datos del Grupo

- **Integrante 1:**
  - **Nombre:** Ana Luz 
  - **Apellido:** Aguirre
  - **DNI:** 43.188.563
  - **Correo Electrónico:** [aguirreluzana5f@gmail.com](mailto:aguirreluzana5f@gmail.com)
  - **GitHub:** [AnaAguirre77](https://github.com/AnaAguirre77)

- **Integrante 2:**
  - **Nombre:** Alan 
  - **Apellido:** García Pagliardini
  - **DNI:** 35.917.637
  - **Correo Electrónico:** [alan.gpagliardini@gmail.com](mailto:alan.gpagliardini@gmail.com)
  - **GitHub:** [pagliardini](https://github.com/pagliardini)

- **Integrante 3:**
  - **Nombre:** Mauricio Leonel
  - **Apellido:** Molina
  - **DNI:** 45.699.198
  - **Correo Electrónico:** [mauri.molina1025@gmail.com](mailto:mauri.molina1025@gmail.com)
  - **GitHub:** [Mauri-Molina](https://github.com/Mauri-Molina)

- **Integrante 4:**
  - **Nombre:** Fabián 
  - **Apellido:** Monar
  - **DNI:** 95.850.539
  - **Correo Electrónico:** [fabian.monar.u@gmail.com](mailto:fabian.monar.u@gmail.com)
  - **GitHub:** [fabianmonar](https://github.com/fabianmonar)

- **Integrante 5:**
  - **Nombre:** Maciel 
  - **Apellido:** Barbero
  - **DNI:** 35.144.709
  - **Correo Electrónico:** [m8barbero@gmail.com](mailto:m8barbero@gmail.com)
  - **GitHub:** [MacielBarbero](https://github.com/MacielBarbero)

### Evidencia 1: Aplicación de Gestión de Usuarios y Operaciones Aritméticas en Python

Este repositorio contiene una aplicación desarrollada en Python como parte de la Evidencia 1. La aplicación maneja el registro y autenticación de usuarios, realiza operaciones aritméticas básicas y cuenta con pruebas unitarias para asegurar su correcto funcionamiento.

#### Archivos y Funcionalidades

- **main.py:** Es el punto de entrada de la aplicación. Contiene las funciones principales para:
  - Mostrar una bienvenida y solicitar datos de acceso.
  - Registrar nuevos usuarios con validaciones de DNI y nombre de usuario únicos.
  - Implementar un captcha basado en operaciones aritméticas para completar el registro.
  - Guardar los registros de usuarios creados y accesos en archivos de texto (`usuariosCreados.txt`, `ingresos.txt`).
  - Manejar intentos fallidos de inicio de sesión y bloquear usuarios tras cuatro intentos fallidos, registrando los intentos en `log.txt`.

- **aritmetica.py:** Módulo que contiene las siguientes funciones para operaciones aritméticas:
  - `sumar(a, b)`: Suma dos números reales y devuelve el resultado con dos decimales.
  - `restar(a, b)`: Resta el segundo número del primero y devuelve el resultado con dos decimales.
  - `dividir(a, b)`: Divide el primer número por el segundo y maneja la división por cero con manejo de excepciones.
  - `multiplicar(a, b)`: Multiplica dos números reales y devuelve el resultado con dos decimales.
  - `sumar_n(*args)`: Suma una cantidad variable de números y devuelve el resultado con dos decimales.
  - `promedio_n(*args)`: Calcula el promedio de una cantidad variable de números y devuelve el resultado con dos decimales.

- **test_aritmetica.py:** Archivo que contiene pruebas unitarias para cada función del módulo `aritmetica.py`. Cada función de prueba (`test_sumar`, `test_restar`, etc.) contiene al menos tres aserciones (`assert`) para verificar la correcta funcionalidad de las operaciones aritméticas.

- **usuariosCreados.txt:** Archivo de texto que guarda un registro de los usuarios creados con sus datos.

- **ingresos.txt:** Archivo de texto que registra los ingresos exitosos de los usuarios con la fecha y hora correspondiente.

- **log.txt:** Archivo de texto que registra los intentos fallidos de inicio de sesión y bloqueos de usuarios.
```
