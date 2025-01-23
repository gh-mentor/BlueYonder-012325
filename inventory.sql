/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- referential integrity is enforced
Steps:
1) Check if the database 'Inventory' exists, if it does exist, drop it and create a new one.
2) Set the default database to 'Inventory'.
3) Create a 'suppliers' table. Use the following columns:
- id: integer, primary key
- name: 50 characters, not null
- address: 255 characters, nullable
- city: 50 characters, not null
- state: 2 characters, not null
4) Create the 'categories' table with a one-to-many relation to the 'suppliers'. Use the following columns:
- id:  integer, primary key
- name: 50 characters, not null
- description:  255 characters, nullable
- supplier_id: int, foreign key references suppliers(id)
5) Create the 'products' table with a one-to-many relation to the 'categories' table. Use the following columns:
- id: integer, primary key
- name: 50 characters, not null
- price: decimal (10, 2), not null
- category_id: int, foreign key references categories(id)
6) Populate the 'suppliers' table with sample data.
7) Populate the 'categories' table with sample data.
8) Populate the 'products' table with sample data.
*/

-- Check if the database 'Inventory' exists
IF DB_ID('Inventory') IS NOT NULL
BEGIN
    -- Drop the database if it already exists
    ALTER DATABASE Inventory
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Inventory;
END
GO

-- Create a new database named 'Inventory'
CREATE DATABASE Inventory;
GO

-- Set the default database to 'Inventory'
USE Inventory;
GO

-- Create the 'suppliers'.
CREATE TABLE suppliers
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    -- add a created_at column to track the creation date
    created_at DATETIME DEFAULT GETDATE(),
    -- add an updated_at column to track the last update date
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Create the 'categories' table with a one-to-many relation to the 'suppliers'
CREATE TABLE categories
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);
GO

-- Create the 'products' table with a one-to-many relation to the 'categories'
CREATE TABLE products
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
GO

-- Populate the 'suppliers' table with sample data
INSERT INTO suppliers (id, name, address, city, state) VALUES
(1, 'Supplier A', '123 Main St', 'City A', 'CA'),
(2, 'Supplier B', '456 Elm St', 'City B', 'NY'),
(3, 'Supplier C', '789 Oak St', 'City C', 'TX');
GO

-- Populate the 'categories' table with sample data
INSERT INTO categories (id, name, description, supplier_id) VALUES
(1, 'Category A', 'Description A', 1),
(2, 'Category B', 'Description B', 2),
(3, 'Category C', 'Description C', 3);
GO

-- Populate the 'products' table with sample data
INSERT INTO products (id, name, price, category_id) VALUES
(1, 'Product A', 10.00, 1),
(2, 'Product B', 20.00, 2),
(3, 'Product C', 30.00, 3);
GO



