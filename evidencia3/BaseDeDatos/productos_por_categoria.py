from conexion import conexion


def listar_categorias_con_productos(conexion): #primero filtramos las categorias que actualmente tienen productos
    cursor = conexion.cursor()
    query = """
        SELECT DISTINCT C.ID_Categoria, C.Nombre 
        FROM Categoria C 
        INNER JOIN Productos P ON C.ID_Categoria = P.ID_Categoria
    """
    cursor.execute(query)
    categorias = cursor.fetchall()
    cursor.close()
    return categorias


def listar_productos_por_categoria(conexion, id_categoria):
    cursor = conexion.cursor()
    query = """
        SELECT P.Nombre AS `Listado de Productos`, C.Nombre AS `Categoría` 
        FROM Productos P 
        INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
        WHERE P.ID_Categoria = %s
    """
    cursor.execute(query, (id_categoria,))
    productos = cursor.fetchall()
    cursor.close()
    return productos


categorias = listar_categorias_con_productos(conexion) # Consultar categorías disponibles que tienen productos

if categorias:
    print("Categorías Disponibles con Productos")
    print("----------------------")
    for categoria in categorias:
        print(f"ID: {categoria[0]}, Nombre: {categoria[1]}")

    # Solicitar al usuario que elija una categoría
    id_categoria_seleccionada = int(input("Seleccione el ID de la categoría que desea filtrar: "))

    # Listar productos de la categoría seleccionada
    productos = listar_productos_por_categoria(conexion, id_categoria_seleccionada)
    if productos:
        print(f"\nProductos en la categoría seleccionada:")
        print("----------------------")
        for producto in productos:
            print(f"Producto: {producto[0]}, Categoría: {producto[1]}")
    else:
        print("No hay productos en la categoría seleccionada.")
else:
    print("No hay categorías registradas con productos.")