CREATE DATABASE assignment_db;
USE assigment_db;
-- Customers
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    signup_date DATE,
    email VARCHAR(100)
);

-- Sales Reps
CREATE TABLE sales_reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    rep_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sales Reps (manual)
INSERT INTO sales_reps VALUES
(1, 'Raj'),
(2, 'Simran'),
(3, 'Aman'),
(4, 'Neha'),
(5, 'Karan');

-- Products (if not imported)
INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Phone', 20000),
(3, 'Tablet', 15000),
(4, 'Headphones', 2000),
(5, 'Keyboard', 1000);

-- Orders (if not imported)
INSERT INTO orders VALUES
(101, 'C001', 1, '2023-06-01'),
(102, 'C002', 2, '2023-06-02'),
(103, 'C003', 1, '2023-06-03'),
(104, 'C004', 3, '2023-06-04'),
(105, 'C005', 4, '2023-06-05');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 4, 2),
(102, 2, 1),
(103, 3, 2),
(104, 5, 5),
(105, 1, 1);

