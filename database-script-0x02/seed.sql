-- Inserting sample data into users table
INSERT INTO users (id, first_name, last_name, email, password_hash, phone_number, role) 
VALUES
  (UUID(), 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '123-456-7890', 'guest'),
  (UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '987-654-3210', 'host'),
  (UUID(), 'Charlie', 'Davis', 'charlie@example.com', 'hashedpassword3', '555-123-4567', 'admin');

-- Inserting sample data into properties table
INSERT INTO properties (id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT id FROM users WHERE email = 'bob@example.com'), 'Cozy Apartment', 'A charming apartment in the city center.', 'New York', 150.00),
  (UUID(), (SELECT id FROM users WHERE email = 'bob@example.com'), 'Beach House', 'A beautiful house by the beach.', 'Miami', 250.00);

-- Inserting sample data into bookings table
INSERT INTO bookings (id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT id FROM properties WHERE name = 'Cozy Apartment'), (SELECT id FROM users WHERE email = 'alice@example.com'), '2025-11-01', '2025-11-05', 750.00, 'confirmed'),
  (UUID(), (SELECT id FROM properties WHERE name = 'Beach House'), (SELECT id FROM users WHERE email = 'alice@example.com'), '2025-12-10', '2025-12-15', 1250.00, 'pending');

-- Inserting sample data into payments table
INSERT INTO payments (id, booking_id, amount, payment_method)
VALUES
  (UUID(), (SELECT id FROM bookings WHERE status = 'confirmed' LIMIT 1), 750.00, 'credit_card'),
  (UUID(), (SELECT id FROM bookings WHERE status = 'pending' LIMIT 1), 1250.00, 'paypal');

-- Inserting sample data into reviews table
INSERT INTO reviews (id, property_id, user_id, rating, comment)
VALUES
  (UUID(), (SELECT id FROM properties WHERE name = 'Cozy Apartment'), (SELECT id FROM users WHERE email = 'alice@example.com'), 4, 'Nice apartment, very clean and well-located.'),
  (UUID(), (SELECT id FROM properties WHERE name = 'Beach House'), (SELECT id FROM users WHERE email = 'alice@example.com'), 5, 'Absolutely loved the beach house, would stay again!');

-- Inserting sample data into messages table
INSERT INTO messages (id, sender_id, recipient_id, message_body)
VALUES
  (UUID(), (SELECT id FROM users WHERE email = 'alice@example.com'), (SELECT id FROM users WHERE email = 'bob@example.com'), 'Hi, I am interested in booking your property in Miami for next month.'),
  (UUID(), (SELECT id FROM users WHERE email = 'bob@example.com'), (SELECT id FROM users WHERE email = 'alice@example.com'), 'Hi Alice, the beach house is available. Feel free to book it!');
