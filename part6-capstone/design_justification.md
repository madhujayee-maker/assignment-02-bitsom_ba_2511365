## Storage Systems

For this hospital AI-powered data system, I selected storage systems tailored to each of the four goals:

1. **Predicting patient readmission risk:** Historical treatment data is best stored in a **relational database (PostgreSQL)** because structured patient records (demographics, diagnosis codes, treatment history) benefit from strong consistency, ACID compliance, and SQL querying for model training. Periodically, this data can be extracted and transformed for AI model training.

2. **Plain English patient history queries:** A **vector database (e.g., Pinecone or Weaviate)** stores embeddings of patient notes and medical history. Combined with an NLP model, this allows doctors to query patient histories in natural language efficiently, even over unstructured text like clinical notes.

3. **Monthly management reports:** For analytics like bed occupancy or department-wise costs, I chose a **columnar OLAP database (e.g., Amazon Redshift or Google BigQuery)**. These are optimized for aggregations and large-scale reporting queries, ensuring quick generation of monthly summaries.

4. **Streaming and storing real-time ICU vitals:** **Time-series databases (e.g., InfluxDB or TimescaleDB)** are ideal here. They handle high-frequency data from ICU monitoring devices efficiently, allow retention policies, and support real-time monitoring dashboards.

This combination ensures each goal uses the storage system optimized for its data type and access pattern.

---

## OLTP vs OLAP Boundary

The **OLTP system** includes patient registration, treatment records, and ICU vitals ingestion — essentially all real-time transactional data. This is primarily stored in PostgreSQL for structured patient data and InfluxDB for streaming vitals.

The **OLAP system** starts where aggregated, historical, or analytical queries are needed. Data from OLTP systems is **ETL/streamed into Redshift/BigQuery** for management reporting, and embeddings from patient notes are indexed in the vector database for NLP queries. By clearly separating transactional operations from analytics, we maintain system performance for both live patient care and historical/aggregated insights.

---

## Trade-offs

One significant trade-off is **latency versus freshness** in AI model predictions and reporting. Streaming ICU vitals must be near real-time, but moving all OLTP data into the OLAP warehouse immediately would increase system complexity and cost. To mitigate this, I propose **hybrid architecture**: real-time pipelines (e.g., Kafka + stream processing) handle critical ICU vitals for immediate monitoring, while ETL jobs update analytical storage in scheduled batches (e.g., nightly) for reports and model retraining. This balances performance, cost, and operational simplicity.
