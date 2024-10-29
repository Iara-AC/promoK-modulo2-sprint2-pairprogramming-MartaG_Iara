/* 1) Extraed los pedidos con el máximo "order_date" para cada empleado. */

SELECT *
FROM orders;

SELECT Max(order_date)
	FROM orders
    WHERE employee_id = 5;
    
SELECT order_id, employee_id, order_date
FROM orders AS o1
WHERE order_date = (SELECT Max(order_date)
					FROM orders AS o2
					WHERE o1.employee_id = o2.employee_id);


/* 2) Extraed el precio unitario máximo (unit_price) de cada producto vendido. */

SELECT product_id, MAX(unit_price)
FROM products
GROUP BY product_id;


SELECT product_id, unit_price AS Max_unit_price_sold
FROM order_details AS od1
WHERE unit_price = ( SELECT MAX(unit_price)
						FROM order_details AS od2
						WHERE od1.product_id = od2.product_id);
                        
/* 3) Extraed información de los productos "Beverages" */



/* 4) Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país */


/* 5) Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread" */


/* BONUS 6) Qué producto es más popular */