/* Creación de una columna temporal */

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/* 1) Ciudades que empiezan con "A" o "B". */

SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR 
city LIKE 'B%';


/* 2) Número de pedidos que han hecho en las ciudades que empiezan con L. */

SELECT city, company_name, contact_name, COUNT(o.order_id) AS TotalPedido
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE city LIKE 'L%'
GROUP BY company_name, city, contact_name
;

/* 3) 
Todos los clientes cuyo "country" no incluya "USA".*/

SELECT company_name, contact_name, country
FROM customers
WHERE country NOT IN ('USA', 'Mexico');

SELECT company_name, contact_name, country
FROM customers
WHERE country <> 'USA';


/* 4) 
Todos los clientes que no tengan una "A" en segunda posición en su nombre.*/

SELECT contact_name 
FROM customers
WHERE contact_name NOT LIKE '_a%'; 


/* 5) Extrae toda la información sobre las compañías que tenemos en las tablas customers y suppliers, y etiqueta cada registro según la tabla de la que proviene.
company_name, city, contact_name */

SELECT company_name, contact_name, city AS ciudad, 'Customers'  AS tabla_origen
FROM customers
UNION
SELECT company_name, contact_name, city, 'Suppliers' AS tabla_origen
FROM suppliers
;

/* ejercicio extra para la que quiera: Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:
 Pista :lâmpada: ¿Ambas tablas tienen las mismas columnas para nombre y apellido? Tendremos que combinar dos columnas usando concat para unir dos columnas. */

SELECT first_name, last_name
from employees;

SELECT contact_name
FROM customers;

SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM employees
UNION ALL
SELECT contact_name
FROM customers;




