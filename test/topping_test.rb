require "./lib/topping"
require "minitest"
require "minitest/autorun"

class ToppingTest < Minitest::Test
  def test_it_makes_a_topping
    t = Topping.new({:name => "anchovies", :price => 1, :is_vegetarian => false})
    assert_equal "anchovies", t.name
    assert_equal 1, t.price
    assert_equal false, t.is_vegetarian
  end
end
