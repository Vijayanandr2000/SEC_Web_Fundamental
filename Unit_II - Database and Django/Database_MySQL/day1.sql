-- Create a new database
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

-- Create a table for storing users
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Insert data into the users table
INSERT INTO users (username, email)
VALUES
    ('user1', 'user1@example.com'),
    ('user2', 'user2@example.com'),
    ('user3', 'user3@example.com');

-- Create a table for storing posts
CREATE TABLE IF NOT EXISTS posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert data into the posts table
INSERT INTO posts (user_id, title, content)
VALUES
    (1, 'Post 1', 'Content of Post 1'),
    (2, 'Post 2', 'Content of Post 2'),
    (3, 'Post 3', 'Content of Post 3');

-- Modify the users table: Add a new column
ALTER TABLE users
ADD COLUMN registration_date DATE;

-- Modify the users table: Change the data type of the email column
ALTER TABLE users
MODIFY COLUMN email VARCHAR(100);

-- Add a unique constraint to the username column
ALTER TABLE users
ADD CONSTRAINT unique_username UNIQUE (username);

-- Remove the unique constraint from the username column
ALTER TABLE users
DROP INDEX unique_username;

-- Drop the registration_date column from the users table
ALTER TABLE users
DROP COLUMN registration_date;

-- Select all users
SELECT * FROM users;

-- Drop the posts table
DROP TABLE IF EXISTS posts;

-- Select all roles
SELECT * FROM roles;

-- Update a user's email address
UPDATE users
SET email = 'updated@example.com'
WHERE user_id = 2;

-- Delete a user by user_id
DELETE FROM users
WHERE user_id = 3;

-- Select all users
SELECT * FROM users;

-- Truncate the roles table (remove all data)
TRUNCATE TABLE roles;

-- Difference between DELETE and TRUNCATE:
-- DELETE removes specific rows based on a condition, and it can be rolled back.
-- TRUNCATE removes all rows from a table and resets auto-increment values, but it cannot be rolled back.

-- Drop the users table
DROP TABLE IF EXISTS users;


------------ JOINS -----------------

-- Sure, here's a brief explanation of each type of SQL join in a single line:

-- 1. INNER JOIN: Returns matching rows from both tables based on a specified condition, excluding non-matching rows.

-- 2. LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and matching rows from the right table; non-matching rows from the left table will have NULL values.

-- 3. RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and matching rows from the left table; non-matching rows from the right table will have NULL values.

-- 4. FULL JOIN (or FULL OUTER JOIN): Returns all rows with matches from either table; non-matching rows from both tables will have NULL values.

---------------------------------------

-- Create a new database
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

-- Create a table for storing employees
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Insert data into the employees table
INSERT INTO employees (first_name, last_name)
VALUES
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Bob', 'Johnson');

-- Create a table for storing departments
CREATE TABLE IF NOT EXISTS departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- Insert data into the departments table
INSERT INTO departments (department_name)
VALUES
    ('HR'),
    ('Finance'),
    ('IT');

-- Common Types of Joins with Comments:

-- INNER JOIN: Returns matching rows from both tables
-- Select employees and their associated department using INNER JOIN
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.employee_id = departments.department_id;

-- LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and matching rows from the right table
-- Select all employees and their associated department (if any) using LEFT JOIN
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.employee_id = departments.department_id;

-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and matching rows from the left table
-- Select all departments and their associated employees (if any) using RIGHT JOIN
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.employee_id = departments.department_id;

-- FULL JOIN (or FULL OUTER JOIN): Returns all rows with matches from either table
-- Select all employees and their associated department (if any) using FULL JOIN
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
FULL JOIN departments ON employees.employee_id = departments.department_id;

-- Clean up: Drop the tables
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;



--------------- AGGREGATE FUNCTIONS ----------------------

-- BEGGINER MODULE

-- Create a new database
CREATE DATABASE IF NOT EXISTS sales_database;
USE sales_database;

-- Create a table for storing sales data
CREATE TABLE IF NOT EXISTS sales (
    product_name VARCHAR(255) NOT NULL,
    sales_amount DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into the "sales" table
INSERT INTO sales (product_name, sales_amount)
VALUES
    ('Product A', 100.00),
    ('Product B', 150.50),
    ('Product A', 75.25),
    ('Product C', 200.00),
    ('Product B', 120.75);

-- Questions with Answers using Aggregate Functions:

-- 1. What is the total sales amount for all products?
SELECT SUM(sales_amount) AS total_sales
FROM sales;

-- 2. What is the average sales amount for each product?
SELECT product_name, AVG(sales_amount) AS avg_sales
FROM sales
GROUP BY product_name;

-- 3. What is the maximum sales amount among all products?
SELECT MAX(sales_amount) AS max_sales
FROM sales;

-- 4. How many sales records are there for each product?
SELECT product_name, COUNT(*) AS sales_count
FROM sales
GROUP BY product_name;

-- 5. What is the minimum sales amount among all products?
SELECT MIN(sales_amount) AS min_sales
FROM sales;

-- Clean up: Drop the "sales" table
DROP TABLE IF EXISTS sales;


---ADVANCED MODULE --

-- Create a new database
CREATE DATABASE IF NOT EXISTS inventory_database;
USE inventory_database;

-- Create a table for storing quantity details
CREATE TABLE IF NOT EXISTS quantity (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- Insert sample quantity data
INSERT INTO quantity (product_name, quantity)
VALUES
    ('Product A', 100),
    ('Product B', 150),
    ('Product C', 75),
    ('Product D', 200),
    ('Product E', 120);

-- Create a table for storing price details
CREATE TABLE IF NOT EXISTS price (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Insert sample price data
INSERT INTO price (product_name, unit_price)
VALUES
    ('Product A', 10.50),
    ('Product B', 15.25),
    ('Product C', 8.75),
    ('Product D', 12.00),
    ('Product E', 9.99);

-- Advanced Queries using GROUP BY, Aggregate Functions, and HAVING Clause:

-- 1. Find the total quantity and average unit price for each product, but only for products with a total quantity greater than 100.
SELECT q.product_name, SUM(q.quantity) AS total_quantity, AVG(p.unit_price) AS avg_unit_price
FROM quantity q
JOIN price p ON q.product_name = p.product_name
GROUP BY q.product_name
HAVING total_quantity > 100;

-- 2. Find the product(s) with the highest unit price.
SELECT product_name, MAX(unit_price) AS highest_unit_price
FROM price;

-- 3. Find the product(s) with the lowest unit price.
SELECT product_name, MIN(unit_price) AS lowest_unit_price
FROM price;

-- Clean up: Drop the tables
DROP TABLE IF EXISTS quantity;
DROP TABLE IF EXISTS price;



--------------Aggregate Functions-------------------

-- Create the "sales" table to store sales information
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL
);

-- Insert sample data into the "sales" table
INSERT INTO sales (order_id, product_name, quantity, unit_price, order_date)
VALUES
    (1, 'Product A', 5, 10.50, '2023-01-15'),
    (2, 'Product B', 3, 8.75, '2023-01-16'),
    (3, 'Product A', 2, 10.50, '2023-01-17'),
    (4, 'Product C', 7, 12.25, '2023-01-17'),
    (5, 'Product B', 4, 8.75, '2023-01-18');

-- Query 1: Count the total number of rows in the "sales" table
SELECT COUNT(*) FROM sales;

-- Query 2: Calculate the sum of the "quantity" column
SELECT SUM(quantity) FROM sales;

-- Query 3: Calculate the average unit price
SELECT AVG(unit_price) FROM sales;

-- Query 4: Find the maximum unit price
SELECT MAX(unit_price) FROM sales;

-- Query 5: Find the minimum unit price
SELECT MIN(unit_price) FROM sales;

-- Query 6: Calculate total quantity sold for each product using GROUP BY
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name;

-- Create the "orders" table to store order information
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL
);

-- Insert sample data into the "orders" table
INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (1, 101, '2023-01-15'),
    (2, 102, '2023-01-16'),
    (3, 101, '2023-01-17'),
    (4, 103, '2023-01-17'),
    (5, 104, '2023-01-18');

-- Create the "order_items" table to store order item details
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into the "order_items" table
INSERT INTO order_items (item_id, order_id, product_name, quantity, unit_price)
VALUES
    (1, 1, 'Product A', 5, 10.50),
    (2, 2, 'Product B', 3, 8.75),
    (3, 3, 'Product A', 2, 10.50),
    (4, 4, 'Product C', 7, 12.25),
    (5, 5, 'Product B', 4, 8.75);

-- Query 7: Calculate total sales revenue for each customer using GROUP BY
SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id;

-- Query 8: Find customers with total purchases greater than or equal to $30 using HAVING
SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING total_revenue >= 30.00;



-- 1. SELECT: This clause specifies the columns you want to retrieve from the tables.

-- 2. FROM: This clause specifies the tables you want to query or join.

-- 3. JOIN: If you're joining multiple tables, the JOIN clause comes after the FROM clause to specify how the tables are related.

-- 4. WHERE: This clause is used to filter rows before grouping and aggregation. It filters rows based on a specified condition.

-- 5. GROUP BY: This clause is used to group rows into sets based on the values in one or more columns.

-- 6. HAVING: This clause filters grouped rows based on a condition. It's similar to the WHERE clause but works on aggregated data.

-- 7. ORDER BY: This clause is used to sort the result set based on one or more columns.


SELECT
    customer_id,
    SUM(total_revenue) AS total_purchase
FROM
    (SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_date >= '2023-01-16'
    GROUP BY o.customer_id
    HAVING total_revenue >= 30.00) AS subquery
ORDER BY total_purchase DESC;


-- In this query:

-- - SELECT: We select the customer_id and calculate the total purchase for each customer.

-- - FROM: We use a subquery to perform the calculations first, which includes the JOIN, WHERE, GROUP BY, and HAVING clauses.

-- - WHERE: We filter orders placed on or after '2023-01-16'.

-- - GROUP BY: We group the results by customer_id.

-- - HAVING: We filter out customers with a total purchase less than $30.

-- - ORDER BY: Finally, we order the result set by total_purchase in descending order.

