require('spec_helper')

describe(Recipe) do
  it {should have_and_belong_to_many(:ingredients)}
  it {should have_and_belong_to_many(:categories)}
  
  it('returns the ingredients in a recipe') do
    recipe = Recipe.create({:name => "Tiki Masala", :rating => 0, :ingredient_ids => [] })
    ingredient1 = Ingredient.create({:name => "rice"}) # multiply ids refer to the join table, not the ingredient table
    ingredient2 = Ingredient.create({:name => "chicken"}) # recipe_ids must be empty, because the push on the line below links the recipe id with the ingredient id in the join table
    recipe.ingredients.push([ingredient1, ingredient2])
    expect(recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
  it('creates an ingredient through a recipe') do
    recipe = Recipe.create({:name => "Tiki Masala", :rating => 0, :ingredient_ids => [] })
    recipe.ingredients.create({:name => "beef"})
    ingredient1 = recipe.ingredients[0]
    expect(recipe.ingredients).to(eq([ingredient1]))
  end

  it('updates the recipe with new ingredients') do
    ingredient1 = Ingredient.create({:name => "rice"})
    ingredient2 = Ingredient.create({:name => "chicken"})
    recipe = Recipe.create({:name => "Tiki Masala"})
    recipe.ingredients.push([ingredient1, ingredient2])
    ingredient3 = Ingredient.create({:name => "water"})
    recipe.update({:ingredient_ids => [ingredient3.id]})
    expect(recipe.ingredients()).to(eq([ingredient3]))
  end

  it('removes an ingredient from the recipe') do
    ingredient1 = Ingredient.create({:name => "rice"})
    ingredient2 = Ingredient.create({:name => "chicken"})
    recipe = Recipe.create({:name => "Tiki Masala"})
    recipe.ingredients.push([ingredient1, ingredient2])
    recipe.ingredients.destroy(ingredient2)
    expect(recipe.ingredients()).to(eq([ingredient1]))
  end

end







# # recipe.ingredients

# ingredient3 = Ingredient.create({:name => "pepper", })
# Recipe.new({:ingredient_ids => [ingredient1.id(), ingredient2.id()]  }) # a recipe with multiple ingredients
#
# ingredient3.recipes.new() # add a new recipe based on the ingredient
#
# recipe.ingredients.push(new_ingredient) #pushes to the join table
