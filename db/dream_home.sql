DROP TABLE dream_home;
CREATE TABLE dream_home(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  bedrooms INT2,
  type VARCHAR(255)
);
