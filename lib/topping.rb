class Topping
  attr_reader :name, :is_vegetarian, :price
  def initialize(data)
    @name = data[:name]
    @is_vegetarian = data[:is_vegetarian]
    @price = data[:price]
  end
end
