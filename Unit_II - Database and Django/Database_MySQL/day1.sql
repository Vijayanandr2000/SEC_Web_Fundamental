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

