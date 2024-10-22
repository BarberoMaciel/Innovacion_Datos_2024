from conexion import conexion


def listar_detalles_ventas(conexion):
    cursor = conexion.cursor()

    query = """
        SELECT 
            CONCAT(C.Nombre, ' ', C.Apellido) AS Cliente, 
            P.Nombre AS `Nombre del Producto`, 
            DV.Cantidad_UNidades, 
            DV.Total_Item
        FROM 
            Productos P
        INNER JOIN 
            Detalle_Ventas DV ON P.Codigo_de_barras = DV.Codigo_de_barras
        INNER JOIN 
            Ventas V ON DV.ID_Venta = V.ID_Venta
        INNER JOIN 
            Clientes C ON V.ID_Cliente = C.ID_Cliente
    """

    cursor.execute(query)
    detalles_ventas = cursor.fetchall()
    cursor.close()

    return detalles_ventas


detalles_ventas = listar_detalles_ventas(conexion)

if detalles_ventas:
    print("Detalles de Ventas")
    print("----------------------")
    for detalle in detalles_ventas:
        print(f"Cliente: {detalle[0]}, Producto: {detalle[1]}, Cantidad: {detalle[2]}, Total: {detalle[3]}")
else:
    print("No hay detalles de ventas registrados.")