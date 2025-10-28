# ERD Libraries System

```mermaid
---
    title: Libraries System
---
erDiagram
    book{
        int id
        string title
        string isbn
        int stock
        int bookshelf_id
    }

    category{
        int id
        string category_name
    }

    bookshelf{
        int id
        string bookshelf_name
        int category_id
    }

    librarian{
        int id
        string librarian_name
        string shift
    }

    borrower{
        int id
        string borrower_name
        string borrower_address
    }

    borrowing{
        int id
        int loan_duration
        int book_id
        int borrower_id
        int librarian_id
    }

    book_categories{
        int id
        int book_id
        int category_id
    }

    librarian ||--|{ borrowing : responsible
    borrower ||--|{ borrowing : borrow
    book ||--|{ borrowing : borrowed
    book ||--|{ book_categories : own
    category ||--|{ book_categories : owned
    book }o--|| bookshelf : occupy
    bookshelf }o--|| category : own
```
