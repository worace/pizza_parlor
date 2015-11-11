require "csv"
require "./lib/topping"

class ToppingsMenu
  attr_reader :toppings
  def initialize
    @toppings = []
  end

  def load_toppings(toppings)
    @toppings = (@toppings + toppings).uniq do |t|
      t.name
    end
  end

  def load_data(path)
    CSV.open(path, headers: true).each do |row|
      data = {:name => row["name"],
              :price => row["price"].to_i,
              :is_vegetarian => (row["is_vegetarian"] == "yes")
            }
      @toppings << Topping.new(data)
    end
  end
end
