pip install duckdb
run_duckdb.py
import duckdb

con = duckdb.connect()

# Q1
print(con.execute("""
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
""").fetchall())

# Q2
print(con.execute("""
SELECT c.customer_name,
       SUM(o.total_amount) AS total_spent
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;
""").fetchall())
python run_duckdb.py
[('C001', 'Alice', 2), ('C002', 'Bob', 1), ('C003', 'Charlie', 3)]
[('Charlie', 450.0), ('Alice', 300.0), ('Bob', 150.0)]


