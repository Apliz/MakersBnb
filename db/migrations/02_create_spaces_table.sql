CREATE TABLE spaces
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  description VARCHAR(250),
  price SMALLINT NOT NULL,
  date_from DATE,
  date_to DATE,
  user_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
