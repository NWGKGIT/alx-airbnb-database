-- Inserting sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) 
VALUES
  (UUID(), 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '123-456-7890', 'guest'),
  (UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '987-654-3210', 'host'),
  (UUID(), 'Charlie', 'Davis', 'charlie@example.com', 'hashedpassword3', '555-123-4567', 'admin');

-- Inserting sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Cozy Apartment', 'A charming apartment in the city center.', 'New York', 150.00),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Beach House', 'A beautiful house by the beach.', 'Miami', 250.00);

-- Inserting sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2025-11-01', '2025-11-05', 750.00, 'confirmed'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2025-12-10', '2025-12-15', 1250.00, 'pending');

-- Inserting sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' LIMIT 1), 750.00, 'credit_card'),
  (UUID(), (SELECT booking_id FROM Booking WHERE status = 'pending' LIMIT 1), 1250.00, 'paypal');

-- Inserting sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 4, 'Nice apartment, very clean and well-located.'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 5, 'Absolutely loved the beach house, would stay again!');

-- Inserting sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Hi, I am interested in booking your property in Miami for next month.'),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Hi Alice, the beach house is available. Feel free to book it!');
