--crear tabla de clientes
create table clientes(
	id_cliente serial primary key,
	nombre_cliente varchar (200),
	email varchar (200) unique not null,
	edad int not null check (edad>=18)
	);
	
--crear tabla de productos
create table productos (
	id_producto serial primary key,
	nombre_producto varchar(200),
	precio_producto NUMERIC(10,2) check (precio_producto > 0),
	categoria varchar(200)
);

--crear tabla de pedidos
create table pedidos (
	id_pedido serial primary key,
	fecha_venta date not null check (fecha_venta <= current_date),
	id_cliente int references clientes (id_cliente)--FK
	);
	
--crear tabla de detalle de pedidos
create table detalle_pedidos(
	id_detalle serial primary key,
	id_pedido int references pedidos (id_pedido), --FK
	id_producto int references productos (id_producto), --FK
	cantidad_producto int not null check (cantidad_producto >0)
);
	
--cargo productos en tabla de prductos
insert into  productos (nombre_producto, categoria, precio_producto)
values
('Calza Madrid', 'Calzas y pantalones', 130000),
('Calza Londres', 'Calzas y pantalones', 140000),
('Remera Natal', 'Remeras', 70000),
('Top Colombia', 'Top', 45000),
('Top Guatemala', 'Top', 48000),
('Calza Turquia', 'Calzas y pantalones', 150000),
('Remera Ecuador', 'Remeras', 75000),
('Remera Canada', 'Remeras', 82000),
('Short San Francisco', 'Short', 65000),
('Top Buenos Aires', 'Top', 42000),
('Top Grecia', 'Top', 40000),
('Calza Brasil', 'Calzas y pantalones', 145000),
('Remera Amsterdam', 'Remeras', 78000),
('Calza Uruguay', 'Calzas y pantalones', 120000),
('Short Marbella', 'Short', 75000),
('Calza Paris', 'Calzas y pantalones', 125000),
('Short Los Angeles', 'Short', 75000),
('Remera Lisboa', 'Remeras', 60000),
('Top Croacia', 'Top', 38000),
('Short Ibiza', 'Short', 72000),
('Calza Barcelona', 'Calzas y pantalones', 115000),
('Calza Portugal', 'Calzas y pantalones', 110000),
('Top Suiza', 'Top', 45000),
('Remera Santiago', 'Remeras', 73000),
('Remera Buzios', 'Remeras', 70000),
('Remera Rio de janeiro', 'Remeras', 81000),
('Short Mendoza', 'Short', 75000),
('Top Suecia', 'Top', 45000);


--cargo clientes en la tabla de clientes
insert into  clientes (nombre_cliente, email, edad)
values
('Maria Perez', 'mariaperez@gmail.com', 36),
('Ines Perez', 'inesperez@gmail.com', 46),
('Clara Alvarez', 'claraalvarez@gmail.com', 28),
('Juana Rodriguez', 'juanar@gmail.com', 33),
('Martina Perez', 'martinaperez@gmail.com', 31),
('Josefina Garcia', 'garciajosefina@gmail.com', 41),
('Lucia Diaz', 'luciadiaz@gmail.com', 27),
('Sofia Martinez', 'sofiamartinez@gmail.com', 36),
('Florencia Amato', 'florenciaamato@gmail.com', 34),
('Laura Torres', 'lauratorres@gmail.com', 32);


--cargo pedidos en tabla de pedidos
insert into  pedidos (fecha_venta, id_cliente)
values
('2026-01-05', 1),
('2026-04-05', 2),
('2026-03-15', 3),
('2026-02-02', 4),
('2026-04-08', 6),
('2026-01-09', 8),
('2026-01-05', 8),
('2026-01-05', 9),
('2026-08-05', 10),
('2026-06-05', 1),
('2026-05-09', 2),
('2026-02-15', 3),
('2026-02-16', 8),
('2026-01-05', 9),
('2026-01-05', 10),
('2026-01-05', 1),
('2026-01-05', 7),
('2026-01-08', 2),
('2026-01-07', 6),
('2026-01-09', 8),
('2026-02-19', 2),
('2026-01-05', 2),
('2026-01-05', 6),
('2026-04-13', 2),
('2026-08-11', 3),
('2026-09-28', 1),
('2026-07-25', 1),
('2026-03-15', 2),
('2026-04-05', 3),
('2026-01-05', 2),
('2026-01-05', 6),
('2026-04-16', 4),
('2026-07-11', 2),
('2026-01-28', 1),
('2026-08-25', 1),
('2026-03-16', 8),
('2026-05-05', 6);


insert into detalle_pedidos(id_pedido, id_producto, cantidad_producto)
values 
(1,1,2),
(1,4,1),
(2,3,2),
(3,6,1),
(3,4,1),
(4,12,2),
(4, 5, 2),
(5, 7, 3),
(5, 12, 1),
(6, 9, 2),
(6, 15, 1),
(6, 1, 1),
(7, 18, 2),
(8, 11, 1),
(8, 20, 2),
(9, 3, 2),
(9, 13, 1),
(10, 4, 1),
(10, 16, 2),
(11, 6, 2),
(12, 8, 1),
(12, 22, 2),
(13, 2, 2),
(13, 14, 1),
(14, 7, 1),
(14, 19, 2),
(15, 23, 1),
(16, 10, 1),
(16, 17, 2),
(16, 1, 3),
(17, 24, 1),
(18, 3, 1),
(18, 12, 2),
(19, 9, 2),
(19, 15, 1),
(20, 6, 1),
(21, 2, 2),
(21, 11, 1),
(22, 4, 1),
(22, 13, 2),
(23, 8, 2),
(23, 18, 1),
(24, 5, 1),
(24, 21, 2),
(25, 7, 2),
(25, 16, 1),
(26, 10, 3),
(26, 22, 1),
(27, 1, 1),
(28, 3, 2),
(29, 19, 1),
(29, 6, 1),
(29, 23, 2),
(30, 2, 1),
(30, 17, 2),
(31, 4, 2),
(31, 24, 1),
(32, 8, 1),
(32, 12, 2),
(33, 9, 2),
(33, 20, 1),
(34, 5, 1),
(34, 18, 2),
(35, 7, 2),
(35, 21, 1),
(36, 10, 1),
(36, 13, 2),
(37, 1, 2),
(37, 22, 1);


--anexo consultas para verificar

select * from clientes;
select * from pedidos;
select * from productos;
select * from detalle_pedidos;

SELECT *
FROM detalle_pedidos
ORDER BY id_pedido, id_detalle;

SELECT COUNT(*) AS cantidad_detalles
FROM detalle_pedidos;


SELECT current_database();