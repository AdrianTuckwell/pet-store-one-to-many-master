DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS pet_store;

CREATE TABLE pet_store(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  pet_store_id INT4 REFERENCES pet_store(id)
);