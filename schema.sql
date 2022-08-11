BEGIN;

-- item table

CREATE TABLE
    items(
        id INT GENERATED ALWAYS AS IDENTITY,
        publish_date DATE NOT NULL,
        archived BOOLEAN NOT NULL,
        PRIMARY KEY(id)
    );

-- books table

CREATE TABLE
    books(
        id SERIAL PRIMARY KEY,
        publisher VARCHAR(100) NOT NULL,
        cover_state VARCHAR(50) NOT NULL,
        FOREIGN KEY (id) REFERENCES items(id)
    );

-- labels table

CREATE TABLE
    labels(
        id SERIAL PRIMARY KEY,
        title VARCHAR(150) NOT NULL,
        color VARCHAR(150) NOT NULL
    );

-- labeled items (books) joining table (one to many relationship)

CREATE TABLE
    labeled_items(
        label_id INT,
        item_id INT,
        FOREIGN KEY (item_id) REFERENCES items(id),
        FOREIGN KEY (label_id) REFERENCES labels(id)
    );

-- authors table

CREATE TABLE
    authors(
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(250) NOT NULL,
        last_name VARCHAR(250) NOT NULL
    );

-- Authored items (books) joining table (one to many relationship)

CREATE TABLE
    authored_items(
        author_id INT,
        item_id INT,
        FOREIGN KEY (author_id) REFERENCES authors(id),
        FOREIGN KEY (item_id) REFERENCES items(id)
    );

COMMIT;