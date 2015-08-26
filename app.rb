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
