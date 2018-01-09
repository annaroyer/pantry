require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_it_has_a_stock
    pantry = Pantry.new

    assert pantry.stock
  end

  def test_stock_starts_empty
    pantry = Pantry.new

    assert pantry.stock.empty?
  end

  def test_it_can_check_if_something_is_in_its_stock
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_restock_ingredients
    pantry = Pantry.new
    assert_equal 0, pantry.stock_check("Cheese")
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")

    pantry.restock("Cheese", 20)
    assert_equal 30, pantry.stock_check("Cheese")
  end
end
