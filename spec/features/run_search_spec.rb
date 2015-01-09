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

  scenario 'invalid search' do
    weather = FactoryGirl.create(:weather)
    user = FactoryGirl.create(:user)
    login_as(user)

    visit edit_user_registration_path(user)
    fill_in "search", with: "asdf"
    click_button "Search"
    
    expect(page).not_to have_content weather.city

  end
end
