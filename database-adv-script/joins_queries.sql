--Retreive all bookings alongside respective users. 
SELECT
    users.first_name,
    properties.name,
    bookings.start_date,
    bookings.end_date
FROM
    bookings
    INNER JOIN users ON users.id = bookings.user_id
    INNER JOIN properties ON properties.id = bookings.property_id
    -- Retrieve all properties and their reviews (including ones that don't have reviews)
SELECT
    properties.name,
    reviews.rating,
    reviews.comment
FROM
    properties
    LEFT JOIN reviews ON properties.id = reviews.property_id
    -- All users and all bookings, even if user has no booking or a booking is not linked to a user
SELECT
    users.first_name,
    bookings.start_date,
    bookings.end_date
FROM
    users
    FULL OUTER JOIN bookings ON users.id=bookings.user_id
