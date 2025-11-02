-- find properties with average raitng greater than 4.0 
SELECT
    properties.name
FROM
    properties
WHERE
    (
        SELECT
            AVG(rating)
        FROM
            reviews
        WHERE
            properties.id = reviews.property_id
    ) > 4
    -- subquery to find users who have made more than 3 bookings.
SELECT
    users.first_name
FROM
    users
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            bookings
        WHERE
            bookings.user_id = users.id
    ) > 3;