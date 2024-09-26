/*
¡¡¡¡¡IMPORTANTE LEER!!!!! 
Ejecutar las sentencias de a una para evitar posibles (y probables) "errores de dependencia", gracias.
*/
USE petShop;

-- Inserción tabla "Categoría".
INSERT INTO `petShop`.`Categoria` (Nombre, Descripcion) VALUES
('Alimentos', 'Comida para mascotas'),
('Juguetes', 'Juguetes para mascotas'),
('Accesorios', 'Accesorios varios'),
('Camas', 'Camas para mascotas'),
('Salud', 'Productos de salud'),
('Higiene', 'Productos de higiene'),
('Ropa', 'Ropa para mascotas'),
('Adiestramiento', 'Productos para adiestramiento'),
('Snacks', 'Snacks para perros y gatos'),
('Cuidados', 'Productos de cuidado'),
('Jardinería', 'Productos para el jardín'),
('Ropa de abrigo', 'Abrigo para mascotas'),
('Viajes', 'Productos para viajar'),
('Educación', 'Material educativo'),
('Seguridad', 'Elementos de seguridad'),
('Tecnología', 'Tecnología para mascotas'),
('Transporte', 'Transportadoras'),
('Fiesta', 'Artículos para fiestas'),
('Celebraciones', 'Celebraciones y eventos'),
('Bebidas', 'Bebidas para mascotas');

-- Inserción tabla "Productos".
INSERT INTO `petShop`.`Productos` (Codigo_de_barras, Nombre, Precio_Unitario, Stock, ID_Categoria, Descripcion, En_Promocion) VALUES
('1234567890123', 'Croquetas Perro', 150.00, 50, 1, 'Croquetas nutritivas para perros', FALSE),
('1234567890124', 'Juguete Squeaky', 30.00, 200, 2, 'Juguete para morder', TRUE),
('1234567890125', 'Correa de Nylon', 40.00, 75, 3, 'Correa resistente para perros', FALSE),
('1234567890126', 'Cama Impermeable', 120.00, 30, 4, 'Cama fácil de limpiar', FALSE),
('1234567890127', 'Vitaminas Caninas', 100.00, 60, 5, 'Vitaminas para perros', TRUE),
('1234567890128', 'Shampoo Natural', 60.00, 40, 6, 'Shampoo para el baño', FALSE),
('1234567890129', 'Abrigo de Invierno', 80.00, 25, 7, 'Abrigo para mascotas pequeñas', TRUE),
('1234567890130', 'Pelota de Juguete', 20.00, 150, 2, 'Pelota resistente para jugar', FALSE),
('1234567890131', 'Galletas para Gatos', 25.00, 80, 9, 'Galletas de sabor a pollo', TRUE),
('1234567890132', 'Caja de Arena', 50.00, 30, 6, 'Caja de arena para gatos', FALSE),
('1234567890133', 'Transportadora Grande', 200.00, 15, 13, 'Transportadora para viajar', TRUE),
('1234567890134', 'Cama Suave', 90.00, 20, 4, 'Cama suave para mascotas', FALSE),
('1234567890135', 'Rascador para Gatos', 70.00, 40, 3, 'Rascador para gatos', TRUE),
('1234567890136', 'Medicamento Antipulgas', 45.00, 50, 5, 'Medicamento para pulgas', FALSE),
('1234567890137', 'Collar Reflectante', 35.00, 100, 3, 'Collar para seguridad nocturna', TRUE),
('1234567890138', 'Snack de Pollo', 55.00, 90, 9, 'Snack para premiar', FALSE),
('1234567890139', 'Cinturón de Seguridad', 60.00, 35, 3, 'Cinturón para autos', TRUE),
('1234567890140', 'Manta Térmica', 45.00, 60, 4, 'Manta para el frío', FALSE),
('1234567890141', 'Bebedero Automático', 75.00, 20, 1, 'Bebedero que regula el agua', TRUE),
('1234567890142', 'Comedero Antideslizante', 50.00, 50, 1, 'Comedero que no se mueve', FALSE);

-- Inserción datos tabla "Proveedores".
INSERT INTO `petShop`.`Proveedores` (CUIT, Nombre, Apellido, Telefono) VALUES
('20-12345678-9', 'Proveedora A', 'García', '123456789'),
('20-23456789-0', 'Proveedora B', 'López', '987654321'),
('20-34567890-1', 'Proveedora C', 'Pérez', '111222333'),
('20-45678901-2', 'Proveedora D', 'Martínez', '444555666'),
('20-56789012-3', 'Proveedora E', 'Fernández', '777888999'),
('20-67890123-4', 'Proveedora F', 'Sánchez', '123123123'),
('20-78901234-5', 'Proveedora G', 'Rodríguez', '321321321'),
('20-89012345-6', 'Proveedora H', 'Gómez', '456456456'),
('20-90123456-7', 'Proveedora I', 'Díaz', '789789789'),
('20-01234567-8', 'Proveedora J', 'Vásquez', '147258369'),
('20-12345679-0', 'Proveedora K', 'Cruz', '369258147'),
('20-23456780-1', 'Proveedora L', 'Morales', '258369147'),
('20-34567891-2', 'Proveedora M', 'Ortega', '159753468'),
('20-45678902-3', 'Proveedora N', 'Ramírez', '852963741'),
('20-56789013-4', 'Proveedora O', 'Hernández', '753951852'),
('20-67890124-5', 'Proveedora P', 'Jiménez', '456123789'),
('20-78901235-6', 'Proveedora Q', 'Torres', '159951357'),
('20-89012346-7', 'Proveedora R', 'Guerrero', '951753456'),
('20-90123457-8', 'Proveedora S', 'Salinas', '753852159'),
('20-01234568-9', 'Proveedora T', 'Paredes', '258147369');

-- Inserción datos tabla "Clientes".
INSERT INTO `petShop`.`Clientes` (Nombre, Apellido, Telefono, Email) VALUES
('Juan', 'Pérez', '123456789', 'juan.perez@example.com'),
('Ana', 'López', '987654321', 'ana.lopez@example.com'),
('Carlos', 'Martínez', '111222333', 'carlos.martinez@example.com'),
('María', 'Fernández', '444555666', 'maria.fernandez@example.com'),
('Pedro', 'Sánchez', '777888999', 'pedro.sanchez@example.com'),
('Lucía', 'Rodríguez', '123123123', 'lucia.rodriguez@example.com'),
('José', 'Gómez', '321321321', 'jose.gomez@example.com'),
('Laura', 'Díaz', '456456456', 'laura.diaz@example.com'),
('David', 'Vásquez', '789789789', 'david.vasquez@example.com'),
('Sara', 'Cruz', '147258369', 'sara.cruz@example.com'),
('Raúl', 'Morales', '369258147', 'raul.morales@example.com'),
('Patricia', 'Ortega', '159753468', 'patricia.ortega@example.com'),
('Javier', 'Ramírez', '852963741', 'javier.ramirez@example.com'),
('Sofia', 'Hernández', '753951852', 'sofia.hernandez@example.com'),
('Victor', 'Jiménez', '456123789', 'victor.jimenez@example.com'),
('Claudia', 'Torres', '159951357', 'claudia.torres@example.com'),
('Gabriel', 'Guerrero', '951753456', 'gabriel.guerrero@example.com'),
('Elena', 'Salinas', '753852159', 'elena.salinas@example.com'),
('Andrés', 'Paredes', '258147369', 'andres.paredes@example.com'),
('Isabel', 'Mendoza', '123321123', 'isabel.mendoza@example.com');

-- Inserción datos tabla "Sucursales".
INSERT INTO `petShop`.`Sucursales` (Ciudad, Direccion, Telefono, Email) VALUES
('Buenos Aires', 'Av. Libertador 1234', '01112345678', 'sucursal1@petshop.com'),
('Córdoba', 'Av. Colón 567', '03511234567', 'sucursal2@petshop.com'),
('Rosario', 'Av. Pellegrini 890', '03411234567', 'sucursal3@petshop.com'),
('Mendoza', 'Av. San Martín 2345', '02611234567', 'sucursal4@petshop.com'),
('La Plata', 'Av. 7 1234', '02211234567', 'sucursal5@petshop.com'),
('Salta', 'Av. Sarmiento 5678', '03871234567', 'sucursal6@petshop.com'),
('Tucumán', 'Av. Aconquija 234', '03814345678', 'sucursal7@petshop.com'),
('Mar del Plata', 'Av. Constitución 123', '02231234567', 'sucursal8@petshop.com'),
('Neuquén', 'Av. Argentina 456', '02991234567', 'sucursal9@petshop.com'),
('Bahía Blanca', 'Av. Colón 789', '02911567890', 'sucursal10@petshop.com'),
('San Juan', 'Av. Libertador 234', '02644567890', 'sucursal11@petshop.com'),
('San Luis', 'Av. 9 de Julio 567', '02664567890', 'sucursal12@petshop.com'),
('Corrientes', 'Av. 3 de Abril 890', '03794567890', 'sucursal13@petshop.com'),
('Catamarca', 'Av. Belgrano 1234', '03833456789', 'sucursal14@petshop.com'),
('Jujuy', 'Av. El Libertador 5678', '03884345678', 'sucursal15@petshop.com'),
('Formosa', 'Av. San Martín 234', '03701723456', 'sucursal16@petshop.com'),
('Río Cuarto', 'Av. 9 de Julio 567', '03583678901', 'sucursal17@petshop.com'),
('Rawson', 'Av. 28 de Julio 890', '02801234567', 'sucursal18@petshop.com'),
('San Fernando del Valle de Catamarca', 'Av. Virgen del Valle 123', '03833345678', 'sucursal19@petshop.com'),
('Santa Rosa', 'Av. San Martín 567', '02932234567', 'sucursal20@petshop.com');

-- Insetar datos en tabla Detalle Ventas.
DELIMITER //

CREATE TRIGGER after_insert_ventas
AFTER INSERT ON petShop.Ventas
FOR EACH ROW
BEGIN
    DECLARE codigo_barras_random VARCHAR(45);
    DECLARE precio_unitario_random DECIMAL(10,2);
    DECLARE cantidad INT DEFAULT 1;  -- Puedes ajustar la cantidad como desees
    DECLARE descuento DECIMAL(5,2) DEFAULT 0.00;  -- Descuento predeterminado
    DECLARE total_item DECIMAL(10,2);

    -- Seleccionar un código de barras aleatorio
    SELECT Codigo_de_barras, Precio_Unitario INTO codigo_barras_random, precio_unitario_random
    FROM petShop.Productos
    ORDER BY RAND()
    LIMIT 1;

    -- Calcular el total del item
    SET total_item = precio_unitario_random * cantidad * (1 - descuento);

    -- Insertar en Detalle_Ventas
    INSERT INTO petShop.Detalle_Ventas (ID_Venta, Codigo_de_barras, Cantidad_Unidades, Precio_Unitario, Descuento, Total_Item)
    VALUES (NEW.ID_Venta, codigo_barras_random, cantidad, precio_unitario_random, descuento, total_item);
END; //

DELIMITER ;


-- Inserción datos tabla "Ventas".
INSERT INTO `petShop`.`Ventas` (Fecha, Forma_Pago, Descuento, Total_Venta, ID_Cliente, ID_Sucursal) VALUES
('2020-01-15', 'Efectivo', 0.00, 150.00, 1, 1),
('2020-02-10', 'Tarjeta', 5.00, 295.00, 2, 2),
('2021-03-05', 'Efectivo', 0.00, 350.00, 3, 3),
('2021-04-12', 'Tarjeta', 10.00, 490.00, 4, 4),
('2022-05-20', 'Efectivo', 0.00, 75.00, 5, 5),
('2022-06-25', 'Tarjeta', 0.00, 120.00, 6, 6),
('2023-07-18', 'Efectivo', 5.00, 220.00, 7, 7),
('2023-08-22', 'Tarjeta', 0.00, 450.00, 8, 8),
('2023-09-30', 'Efectivo', 0.00, 180.00, 9, 9),
('2024-10-04', 'Tarjeta', 15.00, 330.00, 10, 10),
('2024-11-11', 'Efectivo', 0.00, 400.00, 11, 11),
('2024-12-15', 'Tarjeta', 0.00, 60.00, 12, 12),
('2023-12-10', 'Efectivo', 0.00, 300.00, 13, 13),
('2022-01-22', 'Tarjeta', 10.00, 270.00, 14, 14),
('2021-02-11', 'Efectivo', 0.00, 90.00, 15, 15),
('2020-03-05', 'Tarjeta', 5.00, 210.00, 16, 16),
('2024-01-09', 'Efectivo', 0.00, 380.00, 17, 17),
('2022-04-02', 'Tarjeta', 0.00, 500.00, 18, 18),
('2020-05-07', 'Efectivo', 0.00, 175.00, 19, 19),
('2021-06-14', 'Tarjeta', 20.00, 450.00, 20, 20);

-- Insertar datos en tabla "Empleados".
INSERT INTO `petShop`.`Empleados` (CUIL_Empleado, Nombre, Apellido, Telefono, Email, Direccion, ID_Sucursal) VALUES
('20-00123456-1', 'Laura', 'Pérez', '01123456789', 'laura.perez@petshop.com', 'Calle Falsa 1', 1),
('20-00123456-2', 'Diego', 'López', '01123456788', 'diego.lopez@petshop.com', 'Calle Falsa 2', 2),
('20-00123456-3', 'Sofía', 'Martínez', '01123456787', 'sofia.martinez@petshop.com', 'Calle Falsa 3', 3),
('20-00123456-4', 'Miguel', 'González', '01123456786', 'miguel.gonzalez@petshop.com', 'Calle Falsa 4', 4),
('20-00123456-5', 'Julián', 'Hernández', '01123456785', 'julian.hernandez@petshop.com', 'Calle Falsa 5', 5),
('20-00123456-6', 'Carla', 'Sánchez', '01123456784', 'carla.sanchez@petshop.com', 'Calle Falsa 6', 6),
('20-00123456-7', 'Pedro', 'García', '01123456783', 'pedro.garcia@petshop.com', 'Calle Falsa 7', 7),
('20-00123456-8', 'Luisa', 'Díaz', '01123456782', 'luisa.diaz@petshop.com', 'Calle Falsa 8', 8),
('20-00123456-9', 'Andrés', 'Jiménez', '01123456781', 'andres.jimenez@petshop.com', 'Calle Falsa 9', 9),
('20-00123456-0', 'Gabriela', 'Mendoza', '01123456780', 'gabriela.mendoza@petshop.com', 'Calle Falsa 10', 10);

-- Insertar datos en tabla "Detalle_Ventas"
DELIMITER //

CREATE TRIGGER luego_insert_pedidos
AFTER INSERT ON petShop.Pedidos
FOR EACH ROW
BEGIN
    DECLARE codigo_barras_random VARCHAR(45);
    DECLARE precio_unitario_random DECIMAL(10,2);
    DECLARE cantidad INT DEFAULT 1;  -- Puedes ajustar la cantidad como desees
    DECLARE total DECIMAL(10,2);

    -- Seleccionar un código de barras aleatorio
    SELECT Codigo_de_barras, Precio_Unitario INTO codigo_barras_random, precio_unitario_random
    FROM petShop.Productos
    ORDER BY RAND()
    LIMIT 1;

    -- Calcular el total del item
    SET total = precio_unitario_random * cantidad;

    -- Insertar en Detalle_Pedidos
    INSERT INTO petShop.Detalle_Pedidos (ID_Pedido, Codigo_de_barras, Cantidad, Precio_Unitario, Total)
    VALUES (NEW.ID_Pedido, codigo_barras_random, cantidad, precio_unitario_random, total);
END; //

DELIMITER ;

-- Insertar datos en tabla "Pedidos".
INSERT INTO `petShop`.`Pedidos` (Fecha, ID_Proveedor, Estado, ID_Sucursal) VALUES
('2020-01-01', 1, 'Pendiente', 1),
('2021-02-15', 2, 'Completo', 2),
('2022-03-10', 3, 'En Proceso', 3),
('2023-04-20', 4, 'Pendiente', 4),
('2024-05-25', 5, 'Completo', 5),
('2020-06-30', 6, 'Pendiente', 6),
('2021-07-15', 7, 'En Proceso', 7),
('2022-08-20', 8, 'Completo', 8),
('2023-09-10', 9, 'Pendiente', 9),
('2024-10-05', 10, 'En Proceso', 10),
('2020-11-12', 11, 'Completo', 11),
('2021-12-25', 12, 'Pendiente', 12),
('2022-01-30', 13, 'En Proceso', 13),
('2023-02-14', 14, 'Completo', 14),
('2024-03-03', 15, 'Pendiente', 15),
('2020-04-17', 16, 'En Proceso', 16),
('2021-05-22', 17, 'Completo', 17),
('2022-06-11', 18, 'Pendiente', 18),
('2023-07-29', 19, 'En Proceso', 19),
('2024-08-18', 20, 'Completo', 20);




 



