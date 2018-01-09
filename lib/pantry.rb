class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
    @stock.default = 0
  end

  def stock_check(ingredient)
    return @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end
end
