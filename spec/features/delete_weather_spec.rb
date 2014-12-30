require 'rails_helper'

feature 'User deletes an existing weather', %Q{
  As an authenticated user
  I want to delete an existing weather
  So that teh weather can longer be viewed
  } do

  scenario 'with valid data' do
    weather = FactoryGirl.create(:weather)
    visit "/weathers/#{weather.id}"
    click_on "Delete"
    expect(page).to have_content 'Weather successfully deleted'
    expect(page).not_to have_content weather.city
  end
end
