require("bundler/setup")
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @categories = Category.all()
  erb(:index)
end

post('/categories') do
  @for_category = true
  name = params.fetch('name')
  @category = Category.create({:name => name})
  if @category.save
    redirect to('/')
  else
    erb(:errors)
  end
end

get('/categories/:id') do
  @category = Category.find(params.fetch('id').to_i)
  erb(:category)
end

delete('/categories/:id') do
  @category = Category.find(params.fetch('id').to_i)
  @category.delete
  redirect to ('/')
end

get('/categories/:category_id/recipes/new') do
  @category = Category.find(params.fetch('category_id').to_i)
  @from_index = false
  erb(:recipe_form)
end

post('/categories/:category_id/recipes') do
  @for_recipe = true
  @category = Category.find(params.fetch('category_id').to_i)
  name = params.fetch('name')
  instructions = params.fetch('instructions')
  @recipe = @category.recipes.create({:name => name, :instructions => instructions, :rating => nil})
  if @recipe.save
    redirect("/categories/#{@category.id}")
  else
    erb(:errors)
  end
end


get('/recipes/new') do
  @all_categories = Category.all()
  @from_index = true
  erb(:recipe_form)
end

# get('/recipes/:id') do
#   @recipe = Recipe.find(params.fetch('id').to_i)
#   erb(:recipe)
# end

post('/recipes') do
  @for_recipe = true
  category_id = params.fetch('category_id')
  @category = Category.find(category_id)
  name = params.fetch('name')
  instructions = params.fetch('instructions')
  @recipe = @category.recipes.create({:name => name, :instructions => instructions, :rating => nil})
  if @recipe.save
    redirect("/categories/#{@category.id}")
  else
    erb(:errors)
  end
end

get('/categories/:category_id/recipes/:id') do
  @category = Category.find(params.fetch('category_id').to_i)
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe)
end

get('/categories/:category_id/recipes/:recipe_id/ingredients/new') do
  @category = Category.find(params.fetch('category_id').to_i)
  @recipe = Recipe.find(params.fetch('recipe_id'))
  erb(:ingredient_form)
end


post('/categories/:category_id/recipes/:recipe_id/ingredients/new') do
  @category = Category.find(params.fetch('category_id').to_i)
  @recipe = Recipe.find(params.fetch('recipe_id').to_i)
  name = params.fetch('name')
  @recipe.ingredients.create({:name => name})
  redirect("/categories/#{@category.id}/recipes/#{@recipe.id}")
end

patch('/categories/:category_id/recipes/:id') do
  @category = Category.find(params.fetch('category_id').to_i)
  @recipe = Recipe.find(params.fetch('id').to_i)
  rating = params.fetch('rating').to_i
  @recipe.update({:rating => rating})
  redirect("/categories/#{@category.id}/recipes/#{@recipe.id}")
end
