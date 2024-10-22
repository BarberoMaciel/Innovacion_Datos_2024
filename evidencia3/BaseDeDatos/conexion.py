# Importamos el conector MySQL para interactuar con la base de datos
import mysql.connector
# Importamos la clase Error para manejar excepciones relacionadas con la conexión
from mysql.connector import Error
# Importamos el módulo json para trabajar con datos en formato JSON (es una buena practica no manejar datos de conexión directamente)
import json


# Definimos una función para cargar la configuración desde un archivo JSON
def cargar_configuracion():
    # Abrimos el archivo 'config.json' en modo lectura
    with open('config.json') as f:  # referencia al archivo json
        # Cargamos el contenido del archivo JSON en un diccionario y lo devolvemos
        return json.load(f)


# Definimos una función para crear una conexión a la base de datos utilizando la configuración proporcionada
def crear_conexion(config):
    try:
        # Intentamos establecer una conexión a la base de datos usando los parámetros de configuración
        conexion = mysql.connector.connect(
            host=config['host'],  # Dirección del servidor de la base de datos
            user=config['user'],  # Nombre de usuario para acceder a la base de datos
            password=config['password'],  # Contraseña asociada al usuario
            database=config['database']  # Nombre de la base de datos a la que nos queremos conectar
        )

        # Verificamos si la conexión fue exitosa
        if conexion.is_connected():
            print("Conexión exitosa a la base de datos")  # Mensaje de éxito
            return conexion  # Devolvemos el objeto de conexión si fue exitosa

    except Error as e:
        # Si ocurre un error durante la conexión, lo capturamos y mostramos un mensaje
        print(f"Error al conectar a la base de datos: {e}")
        return None  # Devolvemos None si hubo un error


# Cargamos la configuración desde el archivo JSON y la almacenamos en una variable
configuracion = cargar_configuracion()
# Creamos una conexión a la base de datos usando la configuración cargada
conexion = crear_conexion(configuracion)