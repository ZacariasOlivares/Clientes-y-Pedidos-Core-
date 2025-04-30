-- Generar la base de datos utilizando “Forward Engineer”.
-- DROP database  bd_clientes_pedidos_core;
USE bd_clientes_pedidos_core;
-- Inserta al menos cinco nuevos clientes en la tabla “clientes”.

-- ID de cliente lo hice auto increment
INSERT INTO clientes ( nombre, direccion, telefono) VALUES 
	("Zacarias", "San Felipe #1234", 123456789),
	('Pedro', 'Calle Luna #456', 987654321),
    ('María', 'Av. Siempre Viva #742', 456789123),
    ('Lucía', 'Boulevard de los Sueños #99', 321654987),
    ('Carlos', 'Camino Real #77', 741852963);

-- Inserta al menos diez nuevos pedidos en la tabla “pedidos”. Asegúrate de asignar 
-- correctamente el cliente correspondiente a cada pedido utilizando la columna “cliente_id”.

INSERT INTO pedidos (id_cliente, fecha, total) VALUES 
	(1, CURDATE(), 1200.0),
    (1, CURDATE(), 1000.0),
    (1, CURDATE(), 1000.0),
    (1, CURDATE(), 1000.0),
    (1, CURDATE(), 1000.0),
    (2, CURDATE(), 850.5),
    (3, CURDATE(), 400.0),
    (4, CURDATE(), 2300.75),
    (5, CURDATE(), 1250.99),
    (1, CURDATE(), 300.0),
    (2, CURDATE(), 675.0),
    (3, CURDATE(), 950.2),
    (4, CURDATE(), 1420.0),
    (5, CURDATE(), 110.5),
	(2, CURDATE(), 675.0),
    (3, CURDATE(), 950.2),
    (4, CURDATE(), 1420.0),
    (5, CURDATE(), 110.5),
	(4, CURDATE(), 1420.0),
    (5, CURDATE(), 110.5),
    (5, CURDATE(), 110.5);

-- Proyecta todos los clientes de la tabla “clientes” y sus respectivos pedidos.

SELECT 
	clientes.id_cliente,
    clientes.nombre,
    pedidos.id_pedido
FROM clientes inner join pedidos
WHERE clientes.id_cliente = pedidos.id_cliente;

-- Proyecta todos los pedidos realizados por un cliente específico, utilizando su ID.
SELECT 
	c.id_cliente,
    c.nombre,
    p.id_pedido,
    p.fecha
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE c.id_cliente = 1;

-- Calcula el total de todos los pedidos para cada cliente.
SELECT 
	clientes.id_cliente,
    clientes.nombre,
    SUM(total) AS Total
FROM clientes
inner JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
GROUP BY clientes.id_cliente;

-- Elimina un cliente específico de la tabla “clientes” y todos sus pedidos asociados de la tabla “pedidos”.

DELETE FROM pedidos WHERE id_cliente = 4;
DELETE FROM clientes WHERE id_cliente = 4; -- Use ON DELETE CASCADE, se puede ejecutar solo esta consulta y funcionara

-- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos.
SELECT
	clientes.id_cliente,
    clientes.nombre,
    COUNT(pedidos.id_pedido) AS Cantidad_Pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
GROUP BY clientes.id_cliente
ORDER BY Cantidad_pedidos DESC
LIMIT 3;

-- Entrega un archivo .sql que contenga todas las consultas que ejecutaste en el entorno de trabajo.