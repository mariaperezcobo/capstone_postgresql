Proyecto Capstone: Análisis de Datos con PostgreSQL
Descripción del proyecto
Este proyecto tiene como objetivo aplicar herramientas de SQL y PostgreSQL para analizar información de un negocio de venta de indumentaria.
A partir de una base de datos relacional, se busca obtener información relevante sobre las ventas, los productos, las categorías y el comportamiento de los clientes, para facilitar el análisis comercial y la toma de decisiones.
Estructura de la base de datos
La base de datos está organizada en cuatro tablas:
•	clientes: contiene información de los clientes, como nombre, email y edad.
•	productos: registra los productos disponibles, sus precios y categorías.
•	pedidos: almacena los pedidos realizados y sus fechas.
•	detalle_pedidos: registra los productos incluidos en cada pedido y sus cantidades.
Las tablas se relacionan mediante claves primarias y claves foráneas.
Archivos del proyecto
•	estructura.sql: contiene la creación y configuración de las tablas de la base de datos.
•	analisis.sql: contiene las consultas SQL utilizadas para explorar y analizar la información.
Análisis realizados
El proyecto incluye consultas para:
1.	Identificar productos sin precio informado y pedidos sin fecha.
2.	Calcular los ingresos totales por categoría de producto.
3.	Identificar los cinco clientes con mayor gasto.
4.	Detectar los tres productos menos vendidos.
5.	Identificar clientes que no realizaron compras.
6.	Clasificar las categorías según la cantidad de pedidos en los que aparecen.
Para estos análisis se utilizan herramientas de SQL como JOIN, funciones de agregación (SUM y COUNT), GROUP BY, ORDER BY, LEFT JOIN, COALESCE, subconsultas y funciones de ventana como RANK().
Conclusiones y recomendaciones de negocio
Los análisis permiten estudiar el desempeño comercial del negocio desde distintas perspectivas: ingresos por categoría, comportamiento de compra de los clientes y unidades vendidas por producto.
Los resultados obtenidos pueden contribuir a identificar oportunidades comerciales y mejorar la toma de decisiones. 
De las consultas realizadas podemos proponer tomar las siguientes acciones:
Rotación de productos:
Se registraron 4 productos sin ventas: Remera Buzios, Remera Rio de Janeiro, Short Mendoza y Top Suecia. La recomendación es dejar de producir estos productos, ya que no tienen la salida que preveíamos. Con las unidades ya fabricadas, podríamos generar promociones con 25% de descuento o 2x1 para poder vender dichas unidades y aunque sea recuperar el costo de fabricación. 
Comportamiento de los clientes: 
Se identificó un cliente sin ventas. Podemos realizarle propuestas particulares a su mail orientando a incentivar su primera compra, por ejemplo ofrecerle un 20% de descuento en su primera compra para que conozca los productos. 
Ingresos por categoría y cliente: 
las consultas permiten comparar la contribución de las distintas categorías a la facturación e identificar a los clientes que generan mayores ingresos. Esta información puede utilizarse para orientar decisiones comerciales, priorizar acciones de fidelización y mejorar la planificación del surtido. Por ejemplo, mandar a fabricar mas unidades de las categorías que se vendieron. 
Conclusión general
El uso de PostgreSQL permite transformar los registros de ventas en información útil para la toma de decisiones comerciales. Los análisis realizados contribuyen a identificar productos con baja rotación, oportunidades para captar clientes y categorías relevantes para el negocio.
Las recomendaciones propuestas buscan mejorar la gestión del stock, impulsar las ventas y fortalecer la relación con los clientes. Su implementación debería acompañarse de un seguimiento de los resultados para evaluar su impacto comercial y económico.
