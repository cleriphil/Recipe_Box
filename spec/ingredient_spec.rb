require('spec_helper')

describe(Ingredient) do
  it('returns the recipes that contain the ingredient') do
    recipe1 = Recipe.create({:name => "Salad"})
    recipe2 = Recipe.create({:name => "Tiki Masala"})
    ingredient1 = Ingredient.create({:name => "rice"})
    ingredient1.recipes.push([recipe1, recipe2])
    expect(ingredient1.recipes()).to(eq([recipe1, recipe2]))
  end

  it('creates a recipe through an ingredient') do
    ingredient1 = Ingredient.create({:name => "rice", :recipe_ids => [] }) # multiply ids refer to the join table, not the ingredient table
    ingredient1.recipes.create({:name => "hamburger", :rating => 0})
    recipe1 = ingredient1.recipes[0]
    expect(ingredient1.recipes()).to(eq([recipe1]))
  end

  it('it will remove a recipe containing an ingredient') do
    recipe1 = Recipe.create({:name => "Salad"})
    recipe2 = Recipe.create({:name => "Tiki Masala"})
    ingredient1 = Ingredient.create({:name => "rice"})
    ingredient1.recipes.push([recipe1, recipe2])
    ingredient1.recipes.destroy (recipe2)
    expect(ingredient1.recipes).to(eq([recipe1]))
  end
end
