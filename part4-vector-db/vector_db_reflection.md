## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts using natural language queries. Keyword search depends on exact word matching, which means it may fail when different terminology or phrasing is used. For example, a query like "termination clauses" might not match sections labeled as "contract ending conditions."

A vector database solves this problem by using embeddings that capture the semantic meaning of text. Instead of matching exact words, it compares the meaning of the query with stored document sections. This allows the system to retrieve relevant results even when different words are used.

In this system, large contracts would be broken into smaller sections and converted into embeddings. These embeddings are stored in a vector database. When a lawyer asks a question, the query is also converted into an embedding. The system then performs a similarity search to find the most relevant sections of the contract.

This approach improves search accuracy and efficiency. Lawyers can ask questions in natural language without worrying about exact keywords. Therefore, a vector database plays a critical role in enabling semantic search and improving productivity in legal document analysis.