require 'pg'
class Space
  attr_reader :user_id, :name, :description, :price, :date_from, :date_to
  def initialize(user_id:, name:, description:, price:, date_from:, date_to:)
    @user_id = user_id
    @name = name
    @description = description
    @price = price
    @date_from = date_from
    @date_to = date_to
  end
  def self.all 
    connection = PG.connect(dbname: 'listing')
    result = connection.exec("SELECT * FROM spaces;")
    result.map do |place|
      Space.new(
        user_id: place['user_id'],
        name: place['name'],
        description: place['description'],
        price: place['price'],
        date_from: place['date_from'],
        date_to: place['date_to']
      )
    end
  end
end