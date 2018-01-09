class Pantry
  attr_reader :stock,
              :shopping_list,
              :cookbook

  def initialize
    @stock = {}
    @stock.default = 0
    @shopping_list = {}
    @shopping_list.default = 0
    @cookbook = {}
  end

  def stock_check(ingredient)
    return @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient_name, amount|
      @shopping_list[ingredient_name] += amount
    end
  end

  def print_shopping_list
    printed_list = ''
    @shopping_list.each do |ingredient_name, amount|
      printed_list += "* #{ingredient_name}: #{amount}\n"
    end
    puts printed_list
    return printed_list
  end

  def add_to_cookbook(recipe)
    @cookbook[recipe.name] = recipe
  end

  def can_make?(recipe)
    recipe.ingredient_types.all? do |ingredient|
      @stock[ingredient] >= recipe.amount_required(ingredient)
    end
  end

  def potential_recipes
    @cookbook.keep_if do |name, recipe|
      can_make?(recipe)
    end
  end

  def what_can_i_make
    potential_recipes.keys
  end

  def how_many(recipe)
    recipe.ingredient_types.map do |ingredient|
      @stock[ingredient] / recipe.amount_required(ingredient)
    end.sort.shift
  end

  def how_many_can_i_make
    potential_recipes.transform_values do |recipe|
      how_many(recipe)
    end
  end
end
