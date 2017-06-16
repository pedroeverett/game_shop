DROP TABLE games;
DROP TABLE manufacturers;

CREATE TABLE manufacturers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
  );

CREATE TABLE games(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  quantity INT8,
  manufacturer_id INT8 REFERENCES games(id)
);