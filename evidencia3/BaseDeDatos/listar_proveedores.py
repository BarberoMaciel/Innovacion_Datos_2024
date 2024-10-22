# Obtener los proveedores que tienen al menos un pedido registrado.
from conexion import conexion

def listar_proveedores(conexion):
    cursor = conexion.cursor()
    query = """
        SELECT 
            CONCAT(P.Nombre, ' ', P.Apellido) AS Proveedor, 
            COUNT(*) AS `Número de Pedidos`
        FROM 
            Proveedores P 
        INNER JOIN 
            Pedidos ON P.ID_Proveedor = Pedidos.ID_Proveedor
        GROUP BY 
            P.ID_Proveedor 
        HAVING 
            COUNT(*) >= 1
    """
    cursor.execute(query)
    proveedores = cursor.fetchall()
    cursor.close()
    return proveedores

proveedores = listar_proveedores(conexion)
if proveedores:
    print("Lista de Proveedores")
    print("----------------------")
    for proveedor in proveedores:
        print(f"Proveedor: {proveedor[0]}, Número de Pedidos: {proveedor[1]}")
else:
    print("No hay proveedores registrados con pedidos.")