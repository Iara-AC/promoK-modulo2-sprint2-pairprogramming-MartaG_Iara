USE northwind;
-- Productos mas baratos y caros
SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
	FROM products;
-- 2. Número de productos y su precio medio
SELECT COUNT(product_id) AS numero_de_productos, AVG(unit_price) AS precio_medio
	FROM products;
-- 3. Máxima y mínima carga de los pedidos de UK
SELECT MAX(freight) , MIN(freight)
	FROM orders
	WHERE ship_country = ‘UK’ ;
-- 4. Qué productos se venden por encima del precio medio:
SELECT AVG(unit_price)
FROM products;
SELECT  product_name, unit_price
	FROM products
	WHERE unit_price > 28.866363636363637
	ORDER BY unit_price desc;
-- 5. Qué productos se han descontinuado
SELECT  count(product_id)
	FROM products
    WHERE discontinued = 1;
	
-- 6. Detalles de los productos de la query anterior
SELECT product_id, product_name
	FROM products
    WHERE discontinued = 0
    ORDER BY product_id desc
    LIMIT 10;