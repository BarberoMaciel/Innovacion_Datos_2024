
### 1. Preparativos

#### Requisitos

- **Python**: La versión recomendada es la 3.6 o superior.
- **Editor de Código**: Usa un editor de código como Visual Studio Code, PyCharm, o incluso un simple editor de texto como Notepad++.

### 2. Crear el Archivo

1. **Crea un nuevo archivo**: Por ejemplo, `sistema_usuarios.py`.
2. **Copia el Código**: Copia el código completo (incluyendo las clases y el menú) que hemos desarrollado anteriormente en este archivo.

### 3. Ejecutar el Programa

1. **Abre una Terminal o Línea de Comandos**.
2. **Navega al directorio** donde guardaste `sistema_usuarios.py`.
3. Ejecuta el programa con el siguiente comando:

   ```
   python sistema_usuarios.py
   ```

### 4. Probar el Programa

- **Agregar Usuarios**: Prueba agregar nuevos usuarios.
- **Modificar Usuarios**: Modifica los datos de un usuario existente.
- **Eliminar Usuarios**: Intenta eliminar usuarios usando el username o email.
- **Buscar Usuarios**: Busca por username o email.
- **Mostrar Todos los Usuarios**: Muestra la lista de usuarios.
- **Iniciar Sesión**: Intenta iniciar sesión con los usuarios creados.

### 5. Inconvenientes que tuvimos.

Manejo de Errores en el Acceso.
Si un usuario ingresaba un nombre incorrecto, el sistema continuaba pidiendo la contraseña, lo que podía resultar confuso. Para mejorar la experiencia del usuario, implementamos una validación adicional. Ahora, si el nombre de usuario es incorrecto, el sistema no pide la contraseña y vuelve a solicitar el nombre de usuario.

Además, anteriormente no guardábamos los intentos fallidos de acceso. Si un usuario fallaba al ingresar la contraseña, se registraba el intento utilizando el nombre de usuario correcto y la contraseña correspondiente a ese usuario original. Con los cambios realizados, ahora se registra adecuadamente cada intento fallido, incluyendo el nombre de usuario y la contraseña ingresada mediante el método `input()`, asegurando un mejor seguimiento de los intentos fallidos en un archivo de log.


### 6. Instalaciones Necesarias

No es necesario instalar bibliotecas adicionales, ya que el programa utiliza módulos estándar de Python (`pickle`, `datetime`). Asegurarse de tener la versión correcta de Python.
