require('spec_helper')
Capybara.app = Sinatra::Application

describe('the path to create a catagory', {:type => :feature}) do
  it('adds a catagory to the site') do
    visit('/')
    expect(page).to have_content('Recipe Box')
    # fill_in('name', :with => "indian")
    # click_button('Add Category')
    # expect(page).to have_content('indian')
  end
end
