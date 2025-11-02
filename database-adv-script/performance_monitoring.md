# Continuous Performance Monitoring

## Objective
Track and refine performance of frequently used queries.

## Method
- Use `EXPLAIN ANALYZE` on high-usage queries.
- Identify bottlenecks (sequential scans, heavy joins).
- Adjust schema or add indexes.
- Log improvements.

## Observations
| Query | Bottleneck | Action Taken | Improvement |
|-------|-----------|-------------|-------------|
| SELECT * FROM bookings WHERE status = 'confirmed'; | seq scan | Added index on status | ✅ |
| SELECT * FROM users WHERE email = 'test@example.com'; | seq scan | Indexed email | ✅ |
