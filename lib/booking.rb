require_relative './database_connection'

class Booking

  attr_reader :id, :start_date, :end_date

  def initialize(id:, start_date:, end_date:)
    @id = id
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(start_date:, end_date:, space_id:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (start_date, end_date, space_id, user_id) VALUES('#{start_date}', '#{end_date}', '#{space_id}', '#{user_id}') RETURNING id, start_date, end_date, space_id, user_id;"
      )
    Booking.new(
      id: result[0]['id'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date']
      )
  end

end
