# Importamos la conexión desde el archivo conexion.py
from conexion import conexion


def listar_clientes(conexion):
    # Creamos un cursor para ejecutar consultas en la base de datos
    cursor = conexion.cursor()

    # Ejecutamos una consulta SQL para obtener los clientes
    # CONCAT() se usa para combinar el nombre y apellido en una sola columna
    cursor.execute("""
        SELECT CONCAT(Nombre, ' ', Apellido) AS Cliente, 
               Telefono AS `Teléfono`, 
               Email AS `Correo electrónico` 
        FROM Clientes
    """)

    # Recuperamos todos los resultados de la consulta
    clientes = cursor.fetchall()

    # Cerramos el cursor para liberar recursos
    cursor.close()

    # Devolvemos la lista de clientes obtenida
    return clientes


# Llamamos a la función para listar los clientes usando la conexión ya establecida
clientes = listar_clientes(conexion)

# Verificamos si se encontraron clientes
if clientes:
    print("Lista de Clientes")
    print("----------------------")

    # Iteramos sobre la lista de clientes y mostramos sus datos
    for cliente in clientes:
        print(f"Cliente: {cliente[0]}, Teléfono: {cliente[1]}, Email: {cliente[2]}")
else:
    # Mensaje si no hay clientes registrados en la base de datos
    print("No hay clientes registrados.")