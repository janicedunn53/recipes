require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('The recipe section', {:type => :feature}) do
  it('allows the user to navigate to the recipes page') do
    visit('/')
    click_link('Recipes')
    expect(page).to have_content('There are no recipes yet.')
  end

  it('allows the user to add a recipe') do
    visit('/recipes')
    fill_in('name', :with => 'Pulled Pork')
    fill_in('rating', :with => 4)
    click_button('Add Recipe')
    expect(page).to have_content('Pulled Pork')
  end

  it('allows the user to view a recipe') do
    Recipe.create({:name => 'pizza', :rating => 4})
    visit('/recipes')
    click_link('pizza')
    expect(page).to have_content('Ingredients')
  end

  it('allows the user to delete a recipe') do
    Recipe.create({:name => 'pizza', :rating => 4})
    visit('/recipes')
    click_link('pizza')
    click_button('Delete Recipe')
    expect(page).to_not have_content('pizza')
  end
end
