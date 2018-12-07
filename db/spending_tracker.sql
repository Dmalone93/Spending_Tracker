DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;


CREATE TABLE merchants (
id SERIAL PRIMARY KEY,
merchant_name VARCHAR(255)
);

CREATE TABLE tags (
id SERIAL PRIMARY KEY,
spending_catagory VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL PRIMARY KEY,
merchant_id INT REFERENCES merchants(id),
tag_id INT REFERENCES tags(id)
);
