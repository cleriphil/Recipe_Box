require('spec_helper')

describe(Category) do
  it('returns the recipes in a category') do
    category = Category.create({:name => "Indian"})
    recipe = Recipe.create({:name => "Tiki Masala", :rating => 0, :category_id => category.id })
    recipe2 = Recipe.create({:name => "Naan", :rating => 0, :category_id => category.id })
    expect(category.recipes()).to(eq([recipe, recipe2]))
  end
end
