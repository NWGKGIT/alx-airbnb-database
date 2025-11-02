# Partitioning Performance Report

## Objective
Improve performance of range queries on large bookings table.

## Method
- Partitioned `bookings` table by `start_date` (yearly).
- Tested queries filtering by date range.

## Observations
| Query | Before Partition | After Partition | Improvement |
|-------|----------------|----------------|-------------|
| SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31'; | seq scan | partition scan | ✅ significant |
| Execution Time | high | low | ✅ |
