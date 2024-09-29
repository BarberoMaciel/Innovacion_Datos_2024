import pickle  # serializar objetos en Python.
from datetime import datetime

class Usuario:
    def __init__(self, id, username, password, email):
        self.id = id
        self.username = username
        self.password = password
        self.email = email

    def __str__(self):
        return f"Usuario(ID: {self.id}, Username: {self.username}, Email: {self.email})"

class Acceso:
    def __init__(self, id, fechaIngreso, fechaSalida, usuarioLogueado):
        self.id = id
        self.fechaIngreso = fechaIngreso
        self.fechaSalida = fechaSalida
        self.usuarioLogueado = usuarioLogueado

class SistemaUsuarios:
    def __init__(self):
        self.usuarios = self.cargar_usuarios()
        self.contador_id = len(self.usuarios) + 1  # Comenzar desde el siguiente ID disponible

    def cargar_usuarios(self):
        try:
            with open('usuarios.ispc', 'rb') as file:
                return pickle.load(file)
        except FileNotFoundError:
            return {}

    def guardar_usuarios(self):
        with open('usuarios.ispc', 'wb') as file:
            pickle.dump(self.usuarios, file)

    def agregar_usuario(self, username, password, email):
        if username in self.usuarios or email in [user.email for user in self.usuarios.values()]:
            print("El usuario o el email ya existen.")
            return False
        id = self.contador_id
        self.usuarios[id] = Usuario(id, username, password, email)
        self.contador_id += 1
        self.guardar_usuarios()
        print("Usuario agregado exitosamente.")
        return True

    def modificar_usuario(self, id, username, password, email):
        if id not in self.usuarios:
            print("Usuario no encontrado.")
            return False
        
        usuario = self.usuarios[id]
        if username:
            usuario.username = username
        if password:
            usuario.password = password
        if email:
            usuario.email = email
        self.guardar_usuarios()
        print("Usuario modificado exitosamente.")
        return True

    def eliminar_usuario(self, identifier):
        for id, user in list(self.usuarios.items()):
            if user.username == identifier or user.email == identifier:
                del self.usuarios[id]
                self.guardar_usuarios()
                print("Usuario eliminado exitosamente.")
                return True
        print("Usuario no encontrado.")
        return False

    def buscar_usuario(self, identifier):
        for user in self.usuarios.values():
            if user.username == identifier or user.email == identifier:
                return user
        return None

    def mostrar_usuarios(self):
        if not self.usuarios:
            print("No hay usuarios registrados.")
        else:
            for user in self.usuarios.values():
                print(user)

# Funcionalidad para registrar accesos y manejar intentos fallidos.
class SistemaAccesos:
    def __init__(self):
        self.accesos = self.cargar_accesos()

    def cargar_accesos(self):
        try:
            with open('accesos.ispc', 'rb') as file:
                return pickle.load(file)
        except FileNotFoundError:
            return []

    def guardar_accesos(self):
        with open('accesos.ispc', 'wb') as file:
            pickle.dump(self.accesos, file)

    def registrar_acceso(self, usuario, success, password=None):
        fecha_ingreso = datetime.now()
        acceso = Acceso(len(self.accesos) + 1, fecha_ingreso, None, usuario.username)
        self.accesos.append(acceso)
        self.guardar_accesos()  # Guardar en el archivo
        if success:
            print(f"Acceso registrado para {usuario.username}.")
        else:
            with open('logs.txt', 'a') as log_file:
                log_file.write(f"Intento fallido: {usuario.username} - {datetime.now()} - Clave: {password}\n")

# Menú Principal.
def menu_principal():
    sistema_usuarios = SistemaUsuarios()
    sistema_accesos = SistemaAccesos()

    while True:
        print("\n--- Menú Principal ---")
        print("1. Agregar Usuario")
        print("2. Modificar Usuario")
        print("3. Eliminar Usuario")
        print("4. Buscar Usuario")
        print("5. Mostrar Todos los Usuarios")
        print("6. Ingresar al Sistema")
        print("7. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == '1':
            username = input("Ingrese Username: ")
            password = input("Ingrese Password: ")
            email = input("Ingrese Email: ")
            sistema_usuarios.agregar_usuario(username, password, email)

        elif opcion == '2':
            while True:
                id_input = input("Ingrese ID del usuario a modificar (o '0' para salir): ")
                
                if id_input == '0':  # Opción para salir
                    break
                
                try:
                    id = int(id_input)  # Convertir a entero
        
                    # Verifica si el usuario existe
                    if id not in sistema_usuarios.usuarios:
                        print("Usuario no encontrado. ¿Desea intentar de nuevo? (s/n)")
                        salir = input("Ingrese 's' para intentar de nuevo o '0' para salir: ")
                        if salir == '0':
                            break  # Salir si el usuario así lo indica
                        continue  # Volver a pedir el ID
                    
                    # Solicitar nuevos datos
                    username = input("Ingrese nuevo Username (dejar en blanco si no cambia): ")
                    password = input("Ingrese nueva Password (dejar en blanco si no cambia): ")
                    email = input("Ingrese nuevo Email (dejar en blanco si no cambia): ")
        
                    # Intentar modificar el usuario
                    if sistema_usuarios.modificar_usuario(id, username, password, email):
                        print("Usuario modificado exitosamente.")
                        break  # Salir del bucle si la modificación fue exitosa
                    else:
                        print("Error al modificar el usuario. ¿Desea intentar de nuevo? (s/n)")
                        salir = input("Ingrese 's' para intentar de nuevo o '0' para salir: ")
                        if salir == '0':
                            break  # Salir si el usuario así lo indica
                        
                except ValueError:
                    print("Por favor, ingrese un número válido para el ID.")
                    salir = input("Ingrese '0' para salir o cualquier otra tecla para intentar de nuevo: ")
                    if salir == '0':
                        break  # Salir si el usuario así lo indica


        elif opcion == '3':
            identifier = input("Ingrese Username o Email del usuario a eliminar: ")
            sistema_usuarios.eliminar_usuario(identifier)

        elif opcion == '4':
            identifier = input("Ingrese Username o Email a buscar: ")
            usuario = sistema_usuarios.buscar_usuario(identifier)
            if usuario:
                print(usuario)
            else:
                print("Usuario no encontrado.")

        elif opcion == '5':
            sistema_usuarios.mostrar_usuarios()

        elif opcion == '6':
            while True:
                username = input("Ingrese Username: ")
                usuario = sistema_usuarios.buscar_usuario(username)
                if not usuario:
                    print("Usuario incorrecto. Intente nuevamente.")
                else:
                    password = input("Ingrese Password: ")
                    if usuario.password == password:
                        print(f"Ingreso exitoso como {usuario.username}.")
                        sistema_accesos.registrar_acceso(usuario, True)
                        break
                    else:
                        print("Clave incorrecta. Intento fallido.")
                        sistema_accesos.registrar_acceso(usuario, False, password)

            while True:
                print("\n--- Menú de Usuario ---")
                print("1. Volver al Menú Principal")
                print("2. Salir")
                sub_opcion = input("Seleccione una opción: ")
                if sub_opcion == '1':
                    break
                elif sub_opcion == '2':
                    exit()

        elif opcion == '7':
            print("Saliendo de la aplicación...")
            break

        else:
            print("Opción inválida. Intente de nuevo.")

if __name__ == "__main__":
    menu_principal()
