-- Retrieve all bookings with user, property, and payment details
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location AS property_location,
    p.pricepernight,
    pay.amount AS payment_amount,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;
