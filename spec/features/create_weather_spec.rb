require 'rails_helper'

feature 'User adds a new weather', %Q{
  As an authenticated user
  I want to add a weather
  So that others can review it
  } do

  scenario 'with valid data' do
    weather = FactoryGirl.create(:weather)
    visit '/weathers/new'
    fill_in 'City', with: weather.city
    fill_in 'State', with: weather.state
    select '2014', from: 'weather_date_1i'
    select 'December', from: 'weather_date_2i'
    select '29', from: 'weather_date_3i'
    fill_in 'Conditions', with: weather.conditions
    fill_in 'Feel', with: weather.feel
    click_button 'Create New Weather'

    expect(page).to have_content 'New weather successfully submitted'
    expect(page).to have_content weather.city
    expect(page).to have_content weather.date.strftime("%B %d %Y")
  end
end
