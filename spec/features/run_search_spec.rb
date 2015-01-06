require 'rails_helper'

feature 'User searches for a weather', %Q{
  As a user
  I want to find a list of weathers
  So that I can pick a weather to review
  } do

  scenario 'from the index page' do
    FactoryGirl.create_list(:weather, 10)

    visit weathers_path
    fill_in "search", with: "Boston"
    click_on "Search"

    expect(page).to have_content "Boston"

  end



  scenario 'empty search' do
    weather = FactoryGirl.create(:weather)

    visit weathers_path
    fill_in "search", with: "New York"
    click_on "Search"

    expect(page).not_to have_content weather.city

  end
end
