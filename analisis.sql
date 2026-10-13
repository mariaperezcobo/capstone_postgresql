
--Etapa 1: limpieza y verificacion de datos

--verificamos si existen productos sin precio informado para poder revisar y corregir esos registros
select 
id_producto,
nombre_producto,
precio_producto
from productos 
where precio_producto is null;


-- Corregimos los precios faltantes con los valores reales verificados.
--ejemplo: ejecutar solo si el producto 4 cuesta 100000
UPDATE productos
SET precio_producto = 100000
WHERE id_producto = 4
AND precio_producto IS NULL;

--verificamos que los pedidos tengan fecha
select 
	id_pedido,
	fecha_venta
from pedidos
where fecha_venta is null;


--Etapa 2. análisis de los datos

--para mostrar el Ranking de pedidos por categoría con RANK() (Window Function).
--Identificamos las categorías con mayor cantidad de pedidos para detectar cuáles concentran la demanda y asignamos un ranking
select 	
	pr.categoria,
	count(distinct d.id_pedido)	as cantidad_pedidos,--cuento los pedidos
  	RANK() OVER (ORDER BY COUNT(DISTINCT d.id_pedido) DESC) AS ranking--para posicionar en el ranking. puede ser que haya mas de una categoria con el mismo ranking
from detalle_pedidos d --busca en detalle pedidos el id producto, la categoria
join productos pr 
	on d.id_producto = pr.id_producto 
group by pr.categoria
order by ranking;


--consultar los 5 clientes que mas compraron
--primero calculamos el total de ventas por clientes. multiplicando la cant comprada por el precio y sumando todas las compras

select 
	c.id_cliente,
	c.nombre_cliente,
	sum(d.cantidad_producto * pr.precio_producto) --suma los ingresos de cada cliente considerando los precios de los productos y la cant comprada de cada producto
	as ingresos_por_cliente 
from detalle_pedidos d --e la tabla de detalle pedidos, une con pedidos por id de pedidos, con clientes con id cliente y con el producto por id de prod
join pedidos p
	on d.id_pedido = p.id_pedido
join clientes c
	on p.id_cliente = c.id_cliente
join productos pr
	on d.id_producto = pr.id_producto
group by c.id_cliente, c.nombre_cliente --agrupa por nombre de cliente
order by ingresos_por_cliente desc--mestra los clientes ordenados de mayor a menor venta
limit 5;-- me trae los primeros 5


--3 productos menos vendidos. para detectar productos con baja rotación para evaluar posibles acciones comerciales
--uso left join para incluir los productos que no tienen pedidos
select
	pr.id_producto,
	pr.nombre_producto,
	coalesce(sum (d.cantidad_producto),0) as unidades_vendidas -- para sumar las cantidades vendidas
from productos pr --de las tablas productos unida por detalle pedido por el id del producto
left join detalle_pedidos d
	on pr.id_producto = d.id_producto
group by 	
	pr.id_producto, 
	pr.nombre_producto-- agrupo por producto
order by unidades_vendidas asc--ordena de ventas de mayor a menor
limit 3
;


--mostrar las ventas en $ por categorias, ordenadas de mayor a menor
--permite identificar qué categorias contribuyen a la facturacion
select
	pr.categoria,
	sum (d.cantidad_producto * pr.precio_producto) as ingreso_total -- para sumar los montos de los productos por la cantidad vendida
from detalle_pedidos d--de las tablas detalle pedido unida con producto por el id del producto
join productos pr
	on d.id_producto = pr.id_producto
group by pr.categoria-- agrupo por categoria
order by ingreso_total desc--ordena de ventas de mayor a menor
;
		




--consultar si hay clientes q nunca compraron
--esto permite contactarlos para mandarles alguna promocion o deswcuento en su primera compra, para poder fidelizarlos.
select 
	c.nombre_cliente
from clientes c
left join pedidos p
	on c.id_cliente = p.id_cliente
where p.id_pedido is null;



select * from productos;
select * from clientes;
select * from pedidos;
select * from detalle_pedidos;