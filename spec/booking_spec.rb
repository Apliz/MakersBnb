require 'booking'
require 'user'
require 'space'
require 'database_helpers'

describe Booking do

  describe '.create' do
    it 'creates a new booking' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      space = Space.create(name: '4 Green Terrace', description: 'detached', price: 14, date_from: '2020-03-01', date_to: '2020-03-20', user_id: user.id)
      booking = Booking.create(start_date: '2020-03-26', end_date: '2020-03-28', user_id: user.id, space_id: space.id)
      persisted_data = persisted_data(id: booking.id, table: 'bookings')

      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data.first['id']
      expect(booking.start_date).to eq('2020-03-26')
      expect(booking.end_date).to eq('2020-03-28')
    end
  end

end
