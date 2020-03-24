require 'space'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      connection = PG.connect(dbname: 'makers_bnb')
      space = Space.create(name: '42 Evergreen Terrace', description: 'semi-detached', price: 10, date_from: '2020-03-01', date_to: '2020-03-02')
      connection.exec("INSERT INTO spaces(name, description, price, date_from, date_to) VALUES ('42 Evergreen Terrace', 'semi-detached', 10, '2020-03-01', '2020-03-02');")
      expect(space).to be_a Space
      expect(space.name).to eq('42 Evergreen Terrace')
      expect(space.description).to eq('semi-detached')
      expect(space.price).to eq(10)
      expect(space.date_from).to eq('2020-03-01')
      expect(space.date_to).to eq('2020-03-02')
    end
  end

end
