create database library;
use library;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);


CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    borrower_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- insert books

-- Insert more books into the Books table

INSERT INTO Books (title, author, genre, published_year, available)
VALUES ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, false),
       ('1984', 'George Orwell', 'Dystopian', 1949, TRUE),
       ('Moby Dick', 'Herman Melville', 'Adventure', 1851, TRUE),
       ('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, false),
       ('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, TRUE),
       ('The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954, false),
       ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, TRUE),
       ('War and Peace', 'Leo Tolstoy', 'Historical Fiction', 1869, TRUE),
       ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, false),
       ('Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological Fiction', 1866, TRUE);


-- insert borrowers

-- Insert more borrowers into the Borrowers table

INSERT INTO Borrowers (name, email, phone)
VALUES ('Alice Johnson', 'alice.johnson@example.com', '555-2345'),
       ('Bob Smith', 'bob.smith@example.com', '555-3456'),
       ('Catherine Green', 'catherine.green@example.com', '555-4567'),
       ('David Brown', 'david.brown@example.com', '555-5678'),
       ('Emily White', 'emily.white@example.com', '555-6789'),
       ('Frank Harris', 'frank.harris@example.com', '555-7890'),
       ('Grace Lee', 'grace.lee@example.com', '555-8901'),
       ('Henry Davis', 'henry.davis@example.com', '555-9012'),
       ('Isabella Wilson', 'isabella.wilson@example.com', '555-0123'),
       ('Jack Miller', 'jack.miller@example.com', '555-1234');


-- checking availability

-- Check if the book is available
SELECT * FROM Books where available = false;

-- Borrow the book if available
UPDATE Books SET available = FALSE WHERE book_id = 1;

-- Create a transaction record
INSERT INTO Transactions (borrower_id, book_id, borrow_date, due_date)
VALUES (1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

-- return books

-- Mark the book as returned
UPDATE Books SET available = TRUE WHERE book_id = 1;

-- Update the transaction record
UPDATE Transactions
SET return_date = CURDATE(), returned = TRUE
WHERE book_id = 1 AND borrower_id = 1 AND returned = FALSE;


-- check availability of books

SELECT * FROM Books WHERE available = TRUE;

-- overdue books report

SELECT t.transaction_id, b.title, br.name, t.due_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
JOIN Borrowers br ON t.borrower_id = br.borrower_id
WHERE t.due_date < CURDATE() AND t.returned = FALSE;

-- borrowed books report

SELECT t.transaction_id, b.title, br.name, t.borrow_date, t.due_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
JOIN Borrowers br ON t.borrower_id = br.borrower_id
WHERE t.returned = FALSE;


