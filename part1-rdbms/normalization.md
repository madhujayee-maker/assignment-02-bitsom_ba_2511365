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



Keeping all data in a single table may seem simpler initially, but it introduces serious issues such as redundancy, inconsistency, and update anomalies. For example, if customer details, product information, and order transactions are stored together, the same customer name and city would be repeated for every order they place. This leads to data redundancy, increasing storage usage and the risk of inconsistent data if updates are not applied uniformly.

Consider a case where a product price changes. In a single flat table, the price would need to be updated in multiple rows. If one row is missed, it results in inconsistent pricing data, which can lead to incorrect reports. Similarly, deleting a record of an order could unintentionally remove important customer or product information (deletion anomaly).

By normalizing the data into separate tables such as customers, products, orders, and order_items, each entity is stored only once. Relationships are maintained using foreign keys, ensuring data integrity. This structure eliminates redundancy and ensures that updates are applied consistently across the database.

Additionally, normalization improves query efficiency and scalability. For example, retrieving all orders for a specific customer becomes easier and more efficient with structured relationships. Therefore, normalization is not over-engineering but a necessary step to ensure accuracy, maintainability, and long-term scalability of the database system.
