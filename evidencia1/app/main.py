import re
import random
from datetime import datetime
import aritmetica

# Diccionario para almacenar usuarios
usuarios = {}

def validar_usuario_clave(usuario, clave):
    return usuarios.get(usuario) == clave

def validar_clave(clave):
    return (len(clave) >= 8 and
            re.search(r'[a-z]', clave) and
            re.search(r'[A-Z]', clave) and
            re.search(r'[0-9]', clave) and
            re.search(r'[\W_]', clave))

# def captcha():
#     a = round(random.uniform(1, 10), 2)
#     b = round(random.uniform(1, 10), 2)
#     print(f"Resuelva la siguiente operación: {a} + {b} = ?")
#     resultado = float(input("Ingrese el resultado con dos decimales: "))
#     return resultado == round(aritmetica.sumar(a, b), 2)


def captcha(max_intentos=4):
    intentos = 0
    while intentos < max_intentos:
        try:
            a = round(random.uniform(1, 10), 2)
            b = round(random.uniform(1, 10), 2)
            print(f"Resuelva la siguiente operación: {a} + {b} = ?")
            resultado = float(input("Ingrese el resultado con dos decimales: "))
            if resultado == round(a + b, 2):
                print("¡Correcto!")
                return True
            else:
                intentos += 1
                print(f"Respuesta incorrecta. Te quedan {max_intentos - intentos} intentos.")
        except ValueError:
            intentos += 1
            print(f"Entrada inválida. Te quedan {max_intentos - intentos} intentos.")
    
    print("Has agotado tus intentos. Inténtalo de nuevo más tarde.")
    return False

def registrar_usuario():
    nombre = input("Ingrese su nombre: ")
    apellido = input("Ingrese su apellido: ")
    dni = input("Ingrese su DNI: ")
    
    if dni in [user["dni"] for user in usuarios.values()]:
        print("El DNI ya está registrado.")
        return

    email = input("Ingrese su correo electrónico: ")
    fecha_nacimiento = input("Ingrese su fecha de nacimiento (dd/mm/yyyy): ")
    # Validar el nombre de usuario
    while True:
        nombre_usuario = input("Ingrese un nombre de usuario (6-12 caracteres): ")
        if len(nombre_usuario) < 6 or len(nombre_usuario) > 12:
            print("El nombre de usuario debe tener entre 6 y 12 caracteres.")
        elif nombre_usuario in usuarios:
            print("El nombre de usuario ya existe.")
        else:
            break

    # Validar la contraseña
    while True:
        clave = input("Ingrese una contraseña: ")
        if validar_clave(clave):
            break
        else:
            print("La contraseña no cumple con los requisitos.")
            print("Debe contener al menos 8 carácteres: una letra minúscula, una letra mayúscula, un número y un carácter especial.")
    

    if not validar_clave(clave):
        print("La contraseña no cumple con los requisitos.")
        print("Debe contener al menos 8 carácteres: una letra minúscula, una letra mayúscula, un número y un carácter especial.")
        return
    

    if not captcha():
        print("Captcha incorrecto. Intente nuevamente.")
        return
    else:
        print("Registro realizado exitosamente.")

    usuarios[nombre_usuario] = {
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "email": email,
        "fecha_nacimiento": fecha_nacimiento,
        "clave": clave
    }

    print("Usuario registrado exitosamente.")
    with open("usuariosCreados.txt", "a") as file:
        file.write(f"{nombre_usuario}: {usuarios[nombre_usuario]}\n")



def main():
    print("Bienvenido a la aplicación.")
    while True:
        print("\n1. Iniciar sesión\n2. Registrar usuario\n3. Olvidé la contraseña\n4. Salir")
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            usuario = input("Ingrese su nombre de usuario: ")
            clave = input("Ingrese su clave: ")
            if validar_usuario_clave(usuario, clave):
                print("Acceso concedido.")
                with open("ingresos.txt", "a") as file:
                    file.write(f"{usuario} ingresó el {datetime.now()}\n")
            else:
                print("Usuario o clave incorrectos.")
        elif opcion == "2":
            registrar_usuario()
        elif opcion == "3":
            print("Funcionalidad no implementada.")
        elif opcion == "4":
            break
        else:
            print("Opción no válida.")

if __name__ == "__main__":
    main()
