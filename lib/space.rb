require 'pg'
class Space

  attr_reader :id, :name, :description, :price, :date_from, :date_to

  def initialize(id:, name:, description:, price:, date_from:, date_to:)
    @id = id
    @name = name
    @description = description
    @price = price
    @date_from = date_from
    @date_to = date_to
  end

  def self.all
    connection = PG.connect(dbname: 'makers_bnb_test')
    result = connection.exec("SELECT * FROM spaces;")
    result.map do |place|
      Space.new(
        id: place['id'],
        name: place['name'],
        description: place['description'],
        price: place['price'],
        date_from: place['date_from'],
        date_to: place['date_to']
      )
    end
  end

  def self.create
    
  end

end
