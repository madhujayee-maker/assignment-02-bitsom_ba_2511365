1.1 — Anomaly Analysis (REAL DATA BASED)
## Anomaly Analysis
a) Insert Anomaly
In the current table, we cannot insert a new product unless it is part of an order.

Example:
Columns involved: product_id, product_name, category, unit_price

If a new product (e.g., product_id = P2000) is introduced but no order exists yet, we cannot insert it because order_id is required.


b) Update Anomaly
Customer information is repeated across multiple rows.

Example:
customer_id appears multiple times with same customer_name and customer_city.

If a customer (e.g., customer_id = CUST102) changes city from Mumbai to Pune, we must update multiple rows. Missing even one row leads to inconsistent data.

Columns involved:
customer_id, customer_name, customer_city

c) Delete Anomaly
If an order is deleted, related product or sales representative data may be lost.

Example:
If a product appears in only one order and that row is deleted, we lose:
product_id, product_name, category

Columns involved:
order_id, product_id, product_name

This results in loss of important product information.

