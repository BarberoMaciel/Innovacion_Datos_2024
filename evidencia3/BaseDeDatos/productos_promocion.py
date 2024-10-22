from conexion import conexion

def productos_en_promo(conexion):
    try:
        cursor = conexion.cursor()
        cursor.execute("SELECT Nombre, En_Promocion FROM Productos WHERE En_Promocion = 1")
        productos = cursor.fetchall()
        cursor.close()
        return productos
    except Exception as e:
        print(f"Error al obtener productos en promoción: {e}")
        return []

productos = productos_en_promo(conexion)
if productos:
    print(f"Productos en promoción")
    print(f"----------------------")
    for producto in productos:
        print(f"{producto[0]}")
else:
    print("No hay productos en promoción.")