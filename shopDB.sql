 

CREATE DATABASE shop;

USE shop;

CREATE TABLE customer(
cust_id INT PRIMARY KEY AUTO_INCREMENT,
cust_name VARCHAR(50) NOT NULL, 
cust_ph BIGINT, 
cust_email VARCHAR(50)
);

CREATE TABLE product(
prod_id INT PRIMARY KEY AUTO_INCREMENT,
prod_name VARCHAR(50),
prod_cost DECIMAL(10,2)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
cust_id INT, 
order_date DATE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE orderDetails(
order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT, 
prod_id INT,
quantity INT,
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(prod_id) REFERENCES product(prod_id)
);

SHOW TABLES;


INSERT INTO customer(cust_name, cust_ph, cust_email) VALUES 
("sivasai", 9030189361, "sivasainookala@gmail.com"),
("vasanth", 8106941512, "vasanth4604@gmail.com"),
("vishnu", 9052983777, "cmvishnu08@gmail.com");

SELECT * FROM customer;

INSERT INTO product(prod_name, prod_cost) VALUES
("Laptop", 64999.99),
("Earbuds", 1299.90),
("Smart Watch", "1999");

SELECT * FROM product;

INSERT INTO orders(cust_id, order_date) VALUES
(1, '2024-08-15'),
(2, '2023-09-22'),
(3, '2022-03-1');

SELECT * FROM orders;


INSERT INTO orderDetails(order_id, prod_id, quantity) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30);

SELECT * FROM orderDetails;


SELECT cust_name, cust_email FROM customer; 

SELECT * FROM product WHERE prod_cost > 1500;

SELECT * FROM orders WHERE order_date = '2024-08-15';

SELECT * FROM orderDetails ORDER BY quantity DESC;

SELECT * FROM customer ORDER BY cust_name DESC;


SELECT COUNT(*) AS total_count FROM customer;

SELECT AVG(prod_cost) AS avg_cost FROM product;

SELECT MIN(prod_cost) FROM product;

SELECT cust_id, COUNT(*) AS Order_count 
FROM orders 
GROUP BY cust_id;

SELECT prod_id, SUM(quantity) AS TotalQuantitySold 
FROM orderDetails 
GROUP BY prod_id;



SELECT c.cust_name, c.cust_email, o.order_date 
FROM customer c
INNER JOIN orders o 
ON c.cust_id = o.cust_id;


SELECT c.cust_name, c.cust_email, o.order_date 
FROM customer c
LEFT JOIN orders o 
ON c.cust_id = o.cust_id;


INSERT INTO customer(cust_name, cust_ph, cust_email) VALUES 
("vignesh", 9044489361, "vignesh@gmail.com");


SELECT c.cust_name, c.cust_email, o.order_date 
FROM customer c
RIGHT JOIN orders o 
ON c.cust_id = o.cust_id;


SELECT prod_name,
  (SELECT AVG(prod_cost) FROM product) AS AveragePrice
FROM product;

SELECT * FROM product 
WHERE prod_cost > (SELECT AVG(prod_cost) FROM product);

UPDATE product 
SET prod_cost = 550.00 
WHERE prod_name = 'Smart Watch';

SET sql_safe_updates = 0;

select * from customer;






