require "rails_helper"

feature "User updates an existing weather", %{
  As an authenticated user
  I want to update an existing weather
  So that others can view that update
  } do
  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end


  scenario "with valid data" do
    weather = FactoryGirl.create(:weather)
    visit "/weathers/#{weather.id}/edit"
    fill_in "City", with: "Baltimore"
    click_on "Submit"
    expect(page).to have_content "Weather successfully updated"
    expect(page).to have_content "Baltimore"
  end
end
