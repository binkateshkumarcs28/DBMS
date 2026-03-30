-- =========================================
-- 1️. CREATE DATABASE
-- =========================================

-- Create new database
CREATE DATABASE Theater_Booking;

-- Select the database to work on
USE Theater_Booking;

-- =========================================
-- 2️. CREATE TABLES
-- =========================================

-- Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,      -- Unique ID for each movie
    movie_name VARCHAR(100) NOT NULL,             -- Movie title
    language VARCHAR(50)                          -- Movie language
);

-- Shows Table
-- Each movie can have multiple shows (one-to-many relationship)
CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,                      -- Unique show ID
    movie_id INT NOT NULL,                                       -- References Movies table
    show_date DATE NOT NULL,                                     -- Date of show
    show_time TIME NOT NULL,                                     -- Time of show
    
    -- Foreign key ensures show belongs to a valid movie
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
        ON DELETE CASCADE                                        -- If movie deleted → delete shows
);

-- Seats Table
-- Seats belong to a specific show
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,									-- Seat label (A1, B5 etc.)
    status ENUM('Available','Booked') DEFAULT 'Available',				-- Seat availability
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
        ON DELETE CASCADE, 												-- If show deleted → delete seats
    
     -- Prevent duplicate seat numbers in same show
    CONSTRAINT unique_seat_per_show UNIQUE (show_id, seat_number)
);

-- Users Table
-- Stores customer information
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL
);

-- Bookings Table
-- Stores booking records linking user, show, and seat
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    seat_id INT NOT NULL,
    booking_date DATE DEFAULT (CURRENT_DATE),						-- Auto store booking date
    
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
        ON DELETE CASCADE
);

-- =========================================
-- 3️. INSERT SAMPLE DATA
-- =========================================

-- Movies
INSERT INTO Movies (movie_name, language)
VALUES
('Dhurandar 2', 'Hindi'),
('Ra.One', 'Hindi');

-- Insert Shows (linked to movie_id)
INSERT INTO Shows (movie_id, show_date, show_time)
VALUES
(1, '2026-02-20', '18:00:00'),
(1, '2026-02-20', '21:00:00'),
(2, '2026-02-21', '19:00:00');

-- Insert Seats for each show
-- Seats for Show 1
INSERT INTO Seats (show_id, seat_number) VALUES
(1,'A1'),(1,'A2'),(1,'A3'),(1,'A4'),(1,'A5'),
(1,'B1'),(1,'B2'),(1,'B3'),(1,'B4'),(1,'B5');

-- Seats for Show 2
INSERT INTO Seats (show_id, seat_number) VALUES
(2,'A1'),(2,'A2'),(2,'A3'),(2,'A4'),(2,'A5'),
(2,'B1'),(2,'B2'),(2,'B3'),(2,'B4'),(2,'B5');

-- Seats for Show 3
INSERT INTO Seats (show_id, seat_number) VALUES
(3,'A1'),(3,'A2'),(3,'A3'),(3,'A4'),(3,'A5'),
(3,'B1'),(3,'B2'),(3,'B3'),(3,'B4'),(3,'B5');

-- Users
INSERT INTO Users (name, phone, email_id)
VALUES
('Rahul Sharma', '9876543210', 'rahul@smail.com'),
('Aman Verma', '9123456780', 'aman@smail.com'),
('Priya Singh', '9988776655', 'priya@smail.com'),
('Neha Gupta', '8899776655', 'neha@smail.com');

-- =========================================
-- 4️. CREATE TRIGGERS (AUTOMATION)
-- =========================================

-- Trigger 1: Prevent Double Booking
-- Runs BEFORE inserting booking
-- Stops booking if seat already booked

DELIMITER $$

CREATE TRIGGER prevent_double_booking
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    DECLARE seat_status VARCHAR(20);

    SELECT status INTO seat_status
    FROM Seats
    WHERE seat_id = NEW.seat_id;

    IF seat_status = 'Booked' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seat already booked!';
    END IF;
END $$

DELIMITER ;

-- Trigger 2: Auto Book Seat After Insert
-- Automatically marks seat as booked

DELIMITER $$

CREATE TRIGGER auto_book_seat_after_insert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Seats
    SET status = 'Booked'
    WHERE seat_id = NEW.seat_id;
END $$

DELIMITER ;

-- Trigger 3: Handle Seat Change
-- Frees old seat and books new seat

DELIMITER $$

CREATE TRIGGER auto_manage_seat_after_update
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    -- Free old seat
    UPDATE Seats
    SET status = 'Available'
    WHERE seat_id = OLD.seat_id;

    -- Book new seat
    UPDATE Seats
    SET status = 'Booked'
    WHERE seat_id = NEW.seat_id;
END $$

DELIMITER ;

-- =========================================
-- 5️. TEST BOOKING
-- =========================================

INSERT INTO Bookings (user_id, show_id, seat_id)
VALUES
(1, 1, 21),
(2, 1, 22),
(3, 2, 31);

-- =========================================
-- 6️. VIEW DATA
-- =========================================

SELECT * FROM Movies;
SELECT * FROM Shows;
SELECT * FROM Seats;
SELECT * FROM Users;
SELECT * FROM Bookings;


-- Detailed Booking Information using JOIN
-- Combines multiple tables to show complete booking info

-- Detailed Booking View
SELECT b.booking_id, u.name, m.movie_name, s.show_time, se.seat_number
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Seats se ON b.seat_id = se.seat_id;

-- =========================================
-- 7. Changing seats location and booking status updation after altering the seat's location
-- =========================================

UPDATE Bookings
SET seat_id = 30
WHERE booking_id = 7;
