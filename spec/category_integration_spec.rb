require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('The recipes app', {:type => :feature}) do
  describe('the path from home page') do
    it('allows the user to navigate to the categories page') do
      visit('/')
      click_link('Categories')
      expect(page).to have_content('Categories of recipes:')
    end
  end
end
