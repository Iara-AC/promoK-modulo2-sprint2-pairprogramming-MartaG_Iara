/*EJERCICIO 1
Pedidos por empresa en UK: */

SELECT company_name, c.customer_id, country, COUNT(order_id) AS CantidadPedidos
	FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    GROUP BY company_name, customer_id
    HAVING country = 'UK';
    
    
    /*EJERCICIO 2
Productos pedidos por empresa en UK por año: */
 
 SELECT company_name, YEAR(o.order_date) AS Año, COUNT(quantity) AS NumProductos
	FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id
    WHERE country = 'UK'
    GROUP BY c.company_name, YEAR(o.order_date);

/*EJERCICIO 3
Mejorad la query anterior: */

 SELECT company_name, YEAR(o.order_date) AS Año, COUNT(quantity) AS NumProductos, SUM((quantity*unit_price)*(1-discount)) AS DineroTotal
	FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id
    WHERE country = 'UK'
    GROUP BY c.company_name, YEAR(o.order_date);

/*EJERCICIO 4 - BONUS
Pedidos que han realizado cada compañía y su fecha: */

 SELECT o.order_id, company_name, o.order_date AS OrderDate
	FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id
    WHERE country = 'UK'
	GROUP BY o.order_id;

/*EJERCICIO 5 - BONUS
Tipos de producto vendidos: */

SELECT 


