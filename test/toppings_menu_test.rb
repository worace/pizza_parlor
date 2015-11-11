require "minitest"
require "minitest/autorun"
require "./lib/toppings_menu"

class ToppingsMenuTest < Minitest::Test
  def test_it_makes_toppings_from_csv
    tm = ToppingsMenu.new
    tm.load_data("./data/toppings.csv")
    assert tm.toppings.count > 5
  end

  def test_it_loads_an_individual_topping
    topping1 = Topping.new({:name => "anchovies",
                            :price => 5,
                            :is_vegetarian => false})
    tm = ToppingsMenu.new
    tm.load_toppings([topping1])
    assert_equal 1, tm.toppings.count
  end

  def test_it_ignores_second_duplicate_entries
    topping1 = Topping.new({:name => "anchovies",
                            :price => 5,
                            :is_vegetarian => false})
    topping2 = Topping.new({:name => "anchovies",
                            :price => 2,
                            :is_vegetarian => false})

    tm = ToppingsMenu.new
    tm.load_toppings([topping1, topping2])

    assert_equal 1, tm.toppings.count
    assert_equal 5, tm.toppings.first.price
  end
end
