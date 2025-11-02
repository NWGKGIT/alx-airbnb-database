# Index Performance Report

## Objective
Measure query performance before and after creating indexes.

## Method
1. Use `EXPLAIN` or `EXPLAIN ANALYZE` to analyze queries.
2. Record execution time and query plan.
3. Create indexes (see `database_index.sql`).
4. Re-run queries and compare performance.

## Observations
| Query | Before Index | After Index | Improvement |
|-------|--------------|-------------|-------------|
| SELECT * FROM users WHERE email = 'test@example.com'; | seq scan | index scan | ✅ significant |
| SELECT * FROM bookings WHERE user_id = 'uuid'; | seq scan | index scan | ✅ significant |
| SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31'; | seq scan | index scan | ✅ significant |
