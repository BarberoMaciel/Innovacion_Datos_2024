USE petShop;

/* Consultas CRUD */
-- SELECT:
-- Obtener todos los productos que están en promoción.
SELECT Nombre, En_Promocion 
FROM Productos
WHERE En_Promocion = 1;

-- Listar todos los clientes con su teléfono y email. */
SELECT CONCAT(Nombre, " ", Apellido) AS Cliente, Telefono AS `Teléfono`, Email `Correo electrónico`
FROM Clientes;

-- INSERT:
-- Agregar un nuevo proveedor con todos sus datos.
INSERT INTO Proveedores(Cuit, Nombre, Apellido, Telefono) VALUES
(209825649, "Juan", "Laje", 11568963124);
 
-- Insertar un nuevo producto en una categoría específica.
INSERT INTO Productos(Codigo_de_barras, Nombre, Precio_Unitario, Stock, ID_Categoria, Descripcion, En_Promocion) VALUES
("238841544", "Pipeta para pulgas", 200, 15, (SELECT ID_Categoria FROM Categoria WHERE Nombre LIKE 'Salud'), "Para perro pequeños", 0);


-- UPDATE:
-- Actualizar el stock de un producto específico.
UPDATE Productos SET Stock = 14 WHERE Codigo_de_barras = "238841544"; 

-- Cambiar el estado de un pedido a "Completado".
-- Creo tabla temporal
CREATE TEMPORARY TABLE TempPedidos AS
SELECT ID_Pedido 
FROM petShop.Pedidos 
WHERE Estado = 'En Proceso';

UPDATE Pedidos AS P
SET Estado = 'Completado' 
WHERE P.Fecha = '2024-08-15'
AND P.ID_Pedido IN (
    SELECT D.ID_Pedido 
    FROM Detalle_Pedidos AS D
    WHERE D.Codigo_de_barras = '238841544'
) 
AND P.ID_Pedido IN (
    SELECT T.ID_Pedido 
    FROM TempPedidos AS T
);

DROP TEMPORARY TABLE TempPedidos;

-- DELETE
-- Borrar un producto de la base de datos usando el código de barras.
DELETE FROM Productos WHERE Codigo_de_barras= "238841544";

-- Consultas con JOIN
-- JOIN:
-- Listar todos los detalles de ventas, incluyendo información del producto y del cliente (JOIN entre Detalle_Ventas, Ventas y Clientes).
SELECT CONCAT(C.Nombre, " ", C.Apellido) AS Cliente, P.Nombre AS `Nombre del Producto`, DV.Cantidad_UNidades, DV.Total_Item
FROM Productos P
INNER JOIN Detalle_Ventas DV ON P.Codigo_de_barras = DV.Codigo_de_barras
INNER JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
INNER JOIN Clientes C ON V.ID_Cliente = C.ID_Cliente;

-- Mostrar todos los pedidos junto con la información de sus proveedores (JOIN entre Pedidos y Proveedores).
SELECT 
    Pro.Nombre AS Producto, 
    DP.Cantidad, 
    S.Ciudad, 
    S.Direccion, 
    CONCAT(Pr.Nombre, " ", Pr.Apellido) AS Proveedor,
    Pe.Fecha, 
    Pe.Estado
FROM 
    Productos Pro 
INNER JOIN 
    Detalle_Pedidos DP ON DP.Codigo_de_barras = Pro.Codigo_de_barras
INNER JOIN 
    Pedidos Pe ON DP.ID_Pedido = Pe.ID_Pedido
INNER JOIN 
    Sucursales S ON Pe.ID_Sucursal = S.ID_Sucursal  
INNER JOIN 
    Proveedores Pr ON Pe.ID_Proveedor = Pr.ID_Proveedor;  


-- Listar todos los empleados junto con su sucursal, mostrando también otros empleados que están en la misma sucursal.
INSERT INTO Empleados (CUIL_Empleado, Nombre, Apellido, Telefono, Email, Direccion, ID_Sucursal) VALUES
('20-12345678-9', 'Juan', 'Pérez', '123456789', 'juan.perez@example.com', 'Calle 1, A2', 2),
('20-23456789-0', 'Ana', 'Gómez', '987654321', 'ana.gomez@example.com', 'Calle 2, A2', 2),
('20-34567890-1', 'Luis', 'Martínez', '456789123', 'luis.martinez@example.com', 'Calle 3, A4', 4),
('20-45678901-2', 'María', 'Fernández', '321654987', 'maria.fernandez@example.com', 'Calle 4, A10', 10);

SELECT 
    CONCAT(E1.Nombre, " ", E1.Apellido) AS Empleado, 
    E1.ID_Sucursal AS Sucursal, 
    GROUP_CONCAT(CONCAT(E2.Nombre, " ", E2.Apellido) SEPARATOR ', ') AS `Compañeros`
FROM 
    Empleados E1 
INNER JOIN 
    Empleados E2 ON E1.ID_Sucursal = E2.ID_Sucursal
WHERE 
    E1.CUIL_Empleado <> E2.CUIL_Empleado
GROUP BY 
    E1.CUIL_Empleado, E1.Nombre, E1.Apellido, E1.ID_Sucursal;

-- Obtener todos los productos que tienen un precio mayor que el precio promedio de todos los productos.
SELECT Nombre, Precio_Unitario 
FROM Productos 
WHERE Precio_Unitario > (SELECT AVG(Precio_Unitario) FROM Productos);

-- Listar todos los clientes y el total de compras que han realizado (usando una subconsulta para calcular el total).
SELECT 
    c.ID_Cliente,
    c.Nombre,
    c.Apellido,
    (SELECT SUM(v.Total_Venta) 
     FROM petShop.Ventas v 
     WHERE v.ID_Cliente = c.ID_Cliente) AS Total_Compras
FROM 
    petShop.Clientes c;

-- Listar todos los productos que pertenecen a una categoría específica, utilizando una subconsulta en la cláusula WHERE para filtrar por el nombre de la categoría.
SELECT P.Nombre `Listado de Productos`, C.Nombre AS `Categoría` 
FROM Productos P INNER JOIN 
Categoria C ON P.ID_Categoria = C.ID_Categoria
WHERE P.ID_Categoria = (SELECT C.ID_Categoria FROM Categoria C WHERE C.Nombre = "Alimentos");

-- HAVING:
-- Obtener los proveedores que tienen más de un pedido registrado.
SELECT 
    CONCAT(P.Nombre, " ", P.Apellido) AS Proveedor, 
    COUNT(*) AS `Número de Pedidos`
FROM 
    Proveedores P 
INNER JOIN 
    Pedidos ON P.ID_Proveedor = Pedidos.ID_Proveedor
GROUP BY 
    P.ID_Proveedor 
HAVING 
    COUNT(*) >= 1;