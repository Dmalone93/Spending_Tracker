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
value INTEGER,
merchant_id INT REFERENCES merchants(id),
tag_id INT REFERENCES tags(id)

);
