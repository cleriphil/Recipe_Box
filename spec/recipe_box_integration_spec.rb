require('spec_helper')

describe('the path to create a catagory', {:type => :feature}) do
  it('adds a catagory to the site') do
    visit('/')
    fill_in('name', :with => "indian")
    click_button('Add Category')
    expect(page).to have_content('indian')
  end
end
