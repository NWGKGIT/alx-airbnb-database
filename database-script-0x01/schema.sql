-- Create User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_email UNIQUE (email)
);

-- Index on email for User table
CREATE INDEX idx_user_email ON User(email);

-- Creating the Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_host_id FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Index on property_id for Property table
CREATE INDEX idx_property_id ON Property(property_id);

-- Creating the Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_id FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT chk_status CHECK (status IN ('pending', 'confirmed', 'canceled'))
);

-- Index on booking_id for Booking table
CREATE INDEX idx_booking_id ON Booking(booking_id);

-- Creating the Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    CONSTRAINT fk_booking_id FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Index on payment_id for Payment table
CREATE INDEX idx_payment_id ON Payment(payment_id);

-- Creating the Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_id FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Index on review_id for Review table
CREATE INDEX idx_review_id ON Review(review_id);

-- Creating the Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID,
    recipient_id UUID,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender_id FOREIGN KEY (sender_id) REFERENCES User(user_id),
    CONSTRAINT fk_recipient_id FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- Index on message_id for Message table
CREATE INDEX idx_message_id ON Message(message_id);
