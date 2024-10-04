
# Library Management System

## Project Overview
This project is a **Library Management System** built using a MySQL database for managing books, borrowers, and transaction records. It enables librarians to track book availability, handle book borrowing and returning, and generate reports for overdue books and borrowed books.

## Database Schema
The database is designed with three main tables:
- **Books**: Stores information about each book, including title, author, genre, and availability status.
- **Borrowers**: Maintains records of library members with contact information.
- **Transactions**: Tracks book borrow and return activities, linking borrowers with books and recording due dates and return statuses.

## Operations Supported
- Add, update, and delete books and borrower records.
- Check book availability and process borrowing and returning of books.
- Generate reports for:
  - Available books.
  - Borrowed books.
  - Overdue books.
