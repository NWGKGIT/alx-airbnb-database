--number of bookings by each user
SELECT
    users.id,
    COUNT(*)
FROM
    bookings
    INNER JOIN users ON users.id = bookings.user_id
GROUP BY
    bookings.user_id
    -- rank props based on total number of bookings
SELECT
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(b.id) DESC
    ) AS booking_rank
FROM
    properties p
    LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY
    p.id,
    p.name
ORDER BY
    booking_rank;