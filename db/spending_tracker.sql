DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants (
id SERIAL PRIMARY KEY,
merchant_name VARCHAR(255)
);

CREATE TABLE tags (
id SERIAL PRIMARY KEY,
tag_name VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL PRIMARY KEY,
value INT,
day DATE,
budget INT,
merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
tag_id INT REFERENCES tags(id) ON DELETE CASCADE
);

-- do i create a table called time? or do is there a function for timestamp?
