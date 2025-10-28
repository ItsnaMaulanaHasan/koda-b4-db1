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
        FOREIGN KEY (category_id) REFERENCES category (id)
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

INSERT INTO
    category (category_name)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Science'),
    ('History'),
    ('Technology'),
    ('Philosophy'),
    ('Biography'),
    ('Self-Help'),
    ('Romance'),
    ('Mystery'),
    ('Fantasy'),
    ('Thriller');

INSERT INTO
    bookshelf (bookshelf_name, category_id)
VALUES
    ('Shelf A1', 1),
    ('Shelf A2', 1),
    ('Shelf B1', 2),
    ('Shelf B2', 3),
    ('Shelf C1', 4),
    ('Shelf C2', 5),
    ('Shelf D1', 6),
    ('Shelf D2', 7),
    ('Shelf E1', 8),
    ('Shelf E2', 9),
    ('Shelf F1', 10),
    ('Shelf F2', 11);

INSERT INTO
    book (title, isbn, stock, bookshelf_id)
VALUES
    ('The Great Gatsby', '978-0-7432-7356-5', 5, 1),
    (
        'To Kill a Mockingbird',
        '978-0-06-112008-4',
        3,
        1
    ),
    ('1984', '978-0-452-28423-4', 7, 2),
    ('Pride and Prejudice', '978-0-14-143951-8', 4, 2),
    (
        'The Catcher in the Rye',
        '978-0-316-76948-0',
        6,
        1
    ),
    ('Animal Farm', '978-0-452-28424-1', 8, 2),
    ('Brave New World', '978-0-06-085052-4', 5, 3),
    ('The Hobbit', '978-0-547-92822-7', 10, 11),
    (
        'Harry Potter Book 1',
        '978-0-439-70818-8',
        12,
        11
    ),
    ('Lord of the Rings', '978-0-618-64561-1', 8, 11),
    ('Sapiens', '978-0-06-231609-7', 6, 3),
    ('Educated', '978-0-399-59050-4', 5, 4);

INSERT INTO
    borrower (borrower_name, borrower_address)
VALUES
    ('John Doe', 'Jl. Merdeka No. 10, Jakarta'),
    ('Jane Smith', 'Jl. Sudirman No. 25, Bandung'),
    ('Michael Johnson', 'Jl. Thamrin No. 5, Surabaya'),
    ('Emily Davis', 'Jl. Asia Afrika No. 100, Depok'),
    ('David Wilson', 'Jl. Gatot Subroto No. 15, Bogor'),
    ('Sarah Brown', 'Jl. Ahmad Yani No. 30, Tangerang'),
    ('James Taylor', 'Jl. Diponegoro No. 45, Bekasi'),
    (
        'Jessica Anderson',
        'Jl. Pahlawan No. 20, Yogyakarta'
    ),
    ('Daniel Martinez', 'Jl. Pemuda No. 12, Semarang'),
    ('Amanda Thomas', 'Jl. Veteran No. 8, Malang'),
    ('Christopher Lee', 'Jl. Cendana No. 17, Denpasar'),
    ('Ashley White', 'Jl. Melati No. 22, Medan');

INSERT INTO
    librarian (librarian_name, shift)
VALUES
    ('Ahmad Rizki', 'Pagi'),
    ('Siti Nurhaliza', 'Siang'),
    ('Budi Santoso', 'Malam'),
    ('Dewi Lestari', 'Pagi'),
    ('Eko Prasetyo', 'Siang'),
    ('Fitri Handayani', 'Malam'),
    ('Guntur Wibowo', 'Pagi'),
    ('Hana Pertiwi', 'Siang'),
    ('Irfan Hakim', 'Malam'),
    ('Julia Rahmawati', 'Pagi'),
    ('Kevin Anggara', 'Siang'),
    ('Linda Kusuma', 'Malam');

INSERT INTO
    borrowing (loan_duration, book_id, borrower_id, librarian_id)
VALUES
    (7, 1, 1, 1),
    (14, 2, 2, 2),
    (7, 3, 3, 3),
    (14, 4, 4, 1),
    (7, 5, 5, 2),
    (14, 6, 6, 3),
    (7, 7, 7, 1),
    (14, 8, 8, 2),
    (7, 9, 9, 3),
    (14, 10, 10, 1),
    (7, 11, 11, 2),
    (14, 12, 12, 3);

INSERT INTO
    book_categories (book_id, category_id)
VALUES
    (1, 1),
    (1, 9),
    (2, 1),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 1),
    (4, 9),
    (5, 1),
    (6, 1),
    (7, 3),
    (7, 11),
    (8, 11),
    (9, 11),
    (10, 11),
    (11, 2),
    (11, 4),
    (12, 7);