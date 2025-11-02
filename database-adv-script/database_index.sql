
-- USERS table
CREATE INDEX idx_users_email ON users(email);

-- PROPERTIES table
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- BOOKINGS table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- PAYMENTS table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- REVIEWS table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- MESSAGES table
CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);

-- Example to measure performance before/after index
-- BEFORE index creation:
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- AFTER index creation:
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
