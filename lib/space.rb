require_relative './database_connection'
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
    result = DatabaseConnection.query("SELECT * FROM spaces;")
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

  def self.create(name:, description:, price:, date_from:, date_to:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price, date_from, date_to, user_id) VALUES('#{name}', '#{description}', '#{price}', '#{date_from}', '#{date_to}', '#{user_id}') RETURNING id, name, description, price, date_from, date_to, user_id;"
      )
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      date_from: result[0]['date_from'],
      date_to: result[0]['date_to']
      )
  end

end
