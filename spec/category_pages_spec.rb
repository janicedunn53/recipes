require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('The category section', {:type => :feature}) do
  it('allows the user to navigate to the categories page') do
    visit('/')
    click_on('categories')
    expect(page).to have_content('There are no categories yet.')
  end


end
