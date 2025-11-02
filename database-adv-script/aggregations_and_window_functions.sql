-- 1️ Total number of bookings made by each user
SELECT
    u.id AS user_id,
    COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id
ORDER BY total_bookings DESC;

-- 2️ Rank properties based on total number of bookings
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b ON p.id = b.property_id
    GROUP BY p.id, p.name
) AS property_booking_counts
ORDER BY booking_rank;
