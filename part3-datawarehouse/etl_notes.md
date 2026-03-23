## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats such as DD/MM/YYYY, DD-MM-YYYY, and YYYY-MM-DD, which would cause errors during analysis.
Resolution: All dates were converted into a consistent YYYY-MM-DD format before inserting into the dim_date table.

### Decision 2 — Handling Missing (NULL) Values
Problem: Some records had NULL or missing values in important fields such as product category or price.
Resolution: Missing categorical values were replaced with meaningful defaults like 'Unknown', while rows with critical missing numeric values were cleaned or excluded.

### Decision 3 — Fixing Category Inconsistency
Problem: Product categories were inconsistent (e.g., 'electronics', 'Electronics', 'ELECTRONICS'), which affects grouping and aggregation.
Resolution: All category values were standardized to proper case (e.g., 'Electronics', 'Groceries', 'Clothing') before loading into the dimension table.