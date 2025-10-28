CREATE DATABASE libraries_db OWNER itsnamaulana;

CREATE TABLE
    book (
        id SERIAL PRIMARY KEY,
        title VARCHAR(100),
        isbn VARCHAR(50),
        stock INT,
        bookshelf_id INT,
        FOREIGN KEY (bookshelf_id) REFERENCES bookshelf (id)
    );

CREATE TABLE
    borrower (
        id SERIAL PRIMARY KEY,
        borrower_name VARCHAR(100),
        borrower_address VARCHAR(100)
    );

CREATE TABLE
    librarian (
        id SERIAL PRIMARY KEY,
        librarian_name VARCHAR(100),
        shift CHAR(5)
    );

CREATE TABLE
    category (id SERIAL PRIMARY KEY, category_name VARCHAR(20));

CREATE TABLE
    bookshelf (
        id SERIAL PRIMARY KEY,
        bookshelf_name VARCHAR(20),
        category_id INT,
        FOREIGN KEY (category_id) REFERENCES category_id (id)
    );

CREATE TABLE
    borrowing (
        id SERIAL PRIMARY KEY,
        loan_duration INT,
        book_id INT,
        borrower_id INT,
        librarian_id INT,
        FOREIGN KEY (book_id) REFERENCES book (id),
        FOREIGN KEY (borrower_id) REFERENCES borrower (id),
        FOREIGN KEY (librarian_id) REFERENCES librarian (id)
    );

CREATE TABLE
    book_categories (
        id SERIAL PRIMARY KEY,
        book_id INT,
        category_id INT,
        FOREIGN KEY (book_id) REFERENCES book (id),
        FOREIGN KEY (category_id) REFERENCES category (id)
    );