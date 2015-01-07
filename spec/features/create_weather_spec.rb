require 'rails_helper'
require 'vcr'

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
      VCR.use_cassette("create_weather") do
        weather = FactoryGirl.build(:weather)
        visit '/weathers/new'
        fill_in 'City', with: weather.city
        select 'Massachusetts', from: "State"
        click_button 'Create New Weather'

        expect(page).to have_content 'New weather successfully submitted'
        expect(page).to have_content weather.city
        expect(page).to have_content weather.date.strftime("%B %d %Y")
        expect(page).to have_css ("span img")
      end
    end

    scenario 'with invalid city/state' do
      VCR.use_cassette("create_weather_invalid") do
        visit '/weathers/new'
        fill_in "City", with: "Boston"
        select 'California', from: "State"
        click_button 'Create New Weather'

        expect(page).to have_content "Something went wrong with your request. Please check city and state."
      end
    end
  end
