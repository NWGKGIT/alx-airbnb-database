## Normalization

Every table is in Normal Form.

- **1NF:** All data is atomic and each table has its own `id` as the primary key.  
- **2NF:** All non-key attributes fully depend on the primary key. We don’t have any partial dependencies.  
- **3NF:** All non-key attributes depend only on the primary key. No transitive dependencies exist.  
- **4NF:** No multi-valued dependencies; the schema avoids redundancy and anomalies.
