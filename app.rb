require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @categories = Category.all()
  erb(:index)
end

post('/categories') do
  name = params.fetch('name')
  Category.create({:name => name})
  redirect to('/')
end

get('/categories/:id') do
  @category = Category.find(params.fetch('id').to_i)
  erb(:category)
end

get('/categories/:category_id/recipes/new') do
  @category = Category.find(params.fetch('category_id').to_i)
  @from_index = false
  erb(:recipe_form)
end

post('/categories/:category_id/recipes') do
  @category = Category.find(params.fetch('category_id').to_i)
  name = params.fetch('name')
  instructions = params.fetch('instructions')
  @category.recipes.create({:name => name, :instructions => instructions})
  redirect("/categories/#{@category.id}")
end


get('/recipes/new') do
  @all_categories = Category.all()
  @from_index = true
  erb(:recipe_form)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe)
end

post('/recipes') do
  category_id = params.fetch('category_id')
  @category = Category.find(category_id)
  name = params.fetch('name')
  instructions = params.fetch('instructions')
  @category.recipes.create({:name => name, :instructions => instructions})
  redirect("/categories/#{@category.id}")
end
