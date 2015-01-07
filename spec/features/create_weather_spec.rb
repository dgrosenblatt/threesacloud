require 'rails_helper'

feature 'User adds a new weather', %Q{
  As an authenticated user
  I want to add a weather
  So that others can review it
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'with valid data' do
    weather = FactoryGirl.create(:weather)
    visit '/weathers/new'
    fill_in 'City', with: weather.city
    select 'Massachusetts', from: "State"
    click_button 'Create New Weather'

    expect(page).to have_content 'New weather successfully submitted'
    expect(page).to have_content weather.city
    expect(page).to have_content weather.date.strftime("%B %d %Y")
    expect(page).to have_css ("span img")
  end

  scenario 'with invalid city/state' do
    visit '/weathers/new'
    fill_in "City", with: "Boston"
    select 'California', from: "State"
    click_button 'Create New Weather'

    expect(page).to have_content "Something went wrong with your request. Please check city and state."
  end
end
