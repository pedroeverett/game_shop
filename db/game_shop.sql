DROP TABLE games;
DROP TABLE publishers;

CREATE TABLE publishers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
  );

CREATE TABLE games(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  quantity INT8,
  publisher_id INT8 REFERENCES games(id) ON DELETE CASCADE
);