require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('The recipes app', {:type => :feature}) do
  describe('the path from home page') do
    it('allows the user to navigate to the categories page') do
      visit('/')
      click_on('categories')
      expect(page).to have_content('There are no categories yet.')
    end
  end

  describe('the path from home page') do
    it('allows the user to navigate to the recipes page') do
      visit('/')
      click_link('Recipes')
      expect(page).to have_content('There are no recipes yet.')
    end
  end
end
