require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/categories') do
  @categories = Category.all()
  erb(:categories)
end

post('/categories') do
  name = params.fetch('name')
  Category.create({:name => name})
  redirect('/categories')
end

post('/recipes') do
  name = params.fetch('name')
  rating = params.fetch('rating').to_i()
  Recipe.create({:name => name, :rating => rating})
  redirect('/recipes')
end
