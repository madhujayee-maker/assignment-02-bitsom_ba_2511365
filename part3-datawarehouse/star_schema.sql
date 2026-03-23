-- DIMENSION TABLES

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

--------------------------------------------------

-- FACT TABLE

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

--------------------------------------------------
-- CLEANED & STANDARDIZED DATA (from retail_transactions.csv)

-- Dates (standardized format YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2023-01-15', 1, 2023),
(2, '2023-02-10', 2, 2023),
(3, '2023-03-05', 3, 2023),
(4, '2023-04-12', 4, 2023);

-- Products (fixed category casing)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Phone', 'Electronics'),
(3, 'Milk', 'Groceries'),
(4, 'Bread', 'Groceries'),
(5, 'Shirt', 'Clothing');

-- Stores
INSERT INTO dim_store VALUES
(1, 'Store Mumbai', 'Mumbai'),
(2, 'Store Delhi', 'Delhi'),
(3, 'Store Bangalore', 'Bangalore');

--------------------------------------------------
-- FACT TABLE (at least 10 rows, cleaned values)

INSERT INTO fact_sales VALUES
(1,1,1,1,1,50000,50000),
(2,1,2,2,2,20000,40000),
(3,2,1,1,1,50000,50000),
(4,2,3,3,5,100,500),
(5,3,2,2,1,20000,20000),
(6,3,1,1,2,50000,100000),
(7,4,3,3,10,100,1000),
(8,4,4,3,6,50,300),
(9,3,5,2,3,800,2400),
(10,2,5,1,2,800,1600);