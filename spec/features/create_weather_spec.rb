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
      visit '/weathers/new'
      weather = FactoryGirl.create(:weather)

      visit "/weathers"

      expect(page).to have_content weather.city
      expect(page).to have_content weather.date.strftime("%B %d %Y")
      expect(page).to have_css ("div img")
    end

    scenario 'with invalid city/state' do
        visit '/weathers/new'
        fill_in "City", with: "Boston"
        select 'California', from: "State"
        click_button 'Create New Weather'

        expect(page).to have_content "Something went wrong with your request. Please check city and state."
      end
  end
