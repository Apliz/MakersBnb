require 'space'
require 'database_helpers'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      space = Space.create(name: '42 Evergreen Terrace', description: 'semi-detached', price: '10', date_from: '2020-03-01', date_to: '2020-03-02')
      persisted_data = persisted_data(id: space.id, table: 'spaces')
      expect(space).to be_a Space
      expect(space.id).to eq persisted_data.first['id']
      expect(space.name).to eq('42 Evergreen Terrace')
      expect(space.description).to eq('semi-detached')
      expect(space.price).to eq('10')
      expect(space.date_from).to eq('2020-03-01')
      expect(space.date_to).to eq('2020-03-02')
    end
  end


  describe '.all' do
    it 'returns all spaces' do
      space = Space.create(name: '4 Green Terrace', description: 'detached', price: '14', date_from: '2020-03-01', date_to: '2020-03-20')
      Space.create(name: '14 Blue Lane', description: 'semi-detached', price: '14', date_from: '2020-03-01', date_to: '2020-03-20')
      Space.create(name: '1 Red Lane', description: 'apartment', price: '14', date_from: '2020-03-01', date_to: '2020-03-20')
      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq space.id
      expect(spaces.first.name).to eq '4 Green Terrace'
      expect(spaces.first.description).to eq 'detached'
      expect(spaces.first.price).to eq '14'
      expect(spaces.first.date_from).to eq '2020-03-01'
      expect(spaces.first.date_to).to eq '2020-03-20'
    end
  end
end
