CREATE TABLE booked_rooms
(
  booking_id INTEGER,
  FOREIGN KEY(booking_id) REFERENCES bookings(id),
  space_id INTEGER,
  FOREIGN KEY(space_id) REFERENCES spaces(id)
);
