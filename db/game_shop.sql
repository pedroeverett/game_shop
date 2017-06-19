DROP TABLE games;
DROP TABLE genres;
DROP TABLE publishers;

CREATE TABLE publishers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),  
  city VARCHAR(255),
  country VARCHAR(255),
  post_code VARCHAR(255),
  phone VARCHAR(255),
  website VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE genres(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  quantity INT8,
  publisher_id INT8 REFERENCES publishers(id) ON DELETE CASCADE,
  genre_id INT8 REFERENCES genres(id) ON DELETE CASCADE,
  cost_price DECIMAL(8, 2),
  sell_price DECIMAL(8, 2),
  url VARCHAR(255)
);