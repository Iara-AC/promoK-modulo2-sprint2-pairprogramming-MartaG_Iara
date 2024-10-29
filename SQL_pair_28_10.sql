/*  1)
Extraer en una CTE todos los nombres de las compañias y los id de los clientes. */ 

WITH info_customers AS (
						SELECT customer_id AS CustID, company_name AS CompanyName
						FROM customers)
                        
SELECT *
from info_customers;

/* 2) 
Selecciona solo los de que vengan de "Germany" */

SELECT customer_id AS CustID, company_name AS CompanyName
FROM customers
WHERE country = 'Germany'; 

WITH info_customers AS (
						SELECT customer_id AS CustID, company_name AS CompanyName
						FROM customers)
                        
SELECT CustID, CompanyName
from info_customers
INNER JOIN customers
ON info_customers.CustID = customers.customer_id
WHERE country = 'Germany'; 



WITH info_customers AS (
						SELECT customer_id AS CustID, company_name AS CompanyName
						FROM customers
                        WHERE country = 'Germany')
                        
SELECT *
from info_customers;




/* 3)Extraed el id de las facturas y su fecha de cada cliente. */

WITH info_customers AS (
						SELECT customer_id AS CustID, company_name AS CompanyName
						FROM customers)
                        
SELECT CustID, CompanyName, o.order_id, o.order_date
from info_customers
INNER JOIN orders AS o
ON info_customers.CustID = o.customer_id;

/* 4) Contad el número de facturas por cliente */

WITH info_customers AS (
						SELECT customer_id AS CustID, company_name AS CompanyName
						FROM customers)
                        
SELECT CustID, CompanyName, COUNT(o.order_id) AS numero_facturas
from info_customers
INNER JOIN orders AS o
ON info_customers.CustID = o.customer_id
GROUP BY CustID;

/* 5) Cuál la cantidad media pedida de todos los productos ProductID. */

SELECT product_id, AVG(quantity)
FROM order_details
GROUP BY product_id;


SELECT o.product_id, p.product_name AS producto, AVG(quantity)
FROM order_details AS O
INNER JOIN products AS p
ON o.product_id = p.product_id
GROUP BY product_id






