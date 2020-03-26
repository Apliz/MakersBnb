CREATE TABLE bookings
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  user_id INTEGER,
  FOREIGN KEY(user_id) REFERENCES users(id),
  space_id INTEGER,
  FOREIGN KEY(space_id) REFERENCES spaces(id)
);
