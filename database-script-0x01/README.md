# Property Booking Database

PostgreSQL schema for a property rental platform.

## Tables
- `users` – guests, hosts, admins  
- `properties` – listings with details and price  
- `bookings` – reservations with status and dates  
- `payments` – booking payments with method and amount  
- `reviews` – property ratings and comments  
- `messages` – user-to-user messages  

## Enums
- `user_role` – guest, host, admin  
- `booking_status` – pending, confirmed, canceled  
- `payment_methods` – credit_card, paypal, stripe  

## Features
- Foreign key constraints and indexes for performance  
- Auto timestamps for creation and updates  
- Rating check constraint (1–5)  

