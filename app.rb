require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/recipes/rating') do
  @recipes = Recipe.order(:rating)
  erb(:recipes)
end

get('/recipes/name') do
  @recipes = Recipe.order(:name)
  erb(:recipes)
end

post('/recipes/search') do
  ingredient_to_find = params.fetch('ingredient')

  recipes_found= []
  Ingredient.where("ingredient" == ingredient_to_find).find_each do |ingredient|
    recipes_found.push(ingredient.recipe_id)
  end
binding.pry
  recipes = []
  recipes_found.each do |recipe_id|
    recipes.push(Recipe.find(recipes_found))
  end

  @recipes = recipes

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

get('/categories/:id') do
  category_id = params.fetch('id').to_i()
  @category = Category.find(category_id)
  @recipes = Recipe.all()
  erb(:category)
end

get('/recipes/:id') do
  recipe_id = params.fetch('id').to_i()
  @recipe = Recipe.find(recipe_id)
  erb(:recipe)
end

get('/recipe/update/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  erb(:recipe_update)
end

post('/recipe/ingredients') do
  ingredient = params.fetch('ingredient')
  amount = params.fetch('amount')
  recipe_id = params.fetch('recipe_id')
  Ingredient.create(:ingredient => ingredient, :amount => amount, :recipe_id => recipe_id)
  redirect("/recipe/update/#{recipe_id.to_s}")
end

post('/recipe/instructions') do
  instruction = params.fetch('instruction')
  recipe_id = params.fetch('recipe_id')
  Instruction.create(:instruction => instruction, :recipe_id => recipe_id)
  redirect("/recipe/update/#{recipe_id.to_s}")
end

delete('/recipe/delete') do
  recipe = Recipe.find(params.fetch('recipe_id').to_i())
  recipe.destroy()
  redirect('/recipes')
end

post('/category/recipe') do
  id = params.fetch('recipe_select').to_i()
  new_recipe = Recipe.find(id)
  category_id = params.fetch('category_id').to_i()
  category = Category.find(category_id)
  category.recipes.push(new_recipe)
  redirect("/categories/#{category_id.to_s}")
end

delete('/category/delete') do
  category = Category.find(params.fetch('category_id').to_i())
  category.destroy()
  redirect('/categories')
end

delete('/category/recipe') do
  recipe = Recipe.find(params.fetch('recipe_id').to_i())
  category_id = params.fetch('category_id').to_i()
  category = Category.find(category_id)
  category.recipes.destroy(recipe)
  redirect("/categories/#{category_id.to_s}")
end
