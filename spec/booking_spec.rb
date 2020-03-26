require 'booking'
require 'database_helpers'

describe Booking do

  describe '.create' do
    it 'creates a new booking' do
      booking = Booking.create(start_date: '2020-03-26', end_date: '2020-03-28')
      persisted_data = persisted_data(id: booking.id, table: 'bookings')

      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data.first['id']
      expect(booking.start_date).to eq('2020-03-26')
      expect(booking.end_date).to eq('2020-03-28')
    end
  end

end
