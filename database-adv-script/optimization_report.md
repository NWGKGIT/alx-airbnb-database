# Query Optimization Report

## Initial Query
See `performance.sql` for the initial query joining bookings, users, properties, and payments.

## Analysis
- JOINs on columns with proper indexing.
- Sequential scans observed on some queries.
- SELECT * avoided; only required columns selected.

## Refactored Query
- Indexed `user_id`, `property_id`, `booking_id`.
- Added filters for `start_date` when applicable.
- Performance improved based on `EXPLAIN ANALYZE`.

## Observations
| Metric | Before Optimization | After Optimization |
|--------|------------------|-----------------|
| Execution Time | high | lower |
| Index Usage | partial | complete |
| Sequential Scans | yes | no |
