require 'rails_helper'

feature "Deleting a user" do

  before do
    @user = FactoryGirl.create(:user, role: "admin")
    login_as(@user)
  end

  scenario "signed in as admin" do
    @member = FactoryGirl.create(:user, email: "troll@aol.com")
    visit "/admin/users"
    click_link "Delete account for troll@aol.com"

    expect(page).to have_content "Account for troll@aol.com has been deleted."
  end
end

feature "Deleting a weather" do

  scenario "signed in as admin" do
    @user = FactoryGirl.create(:user, role: "admin")
    login_as(@user)
    @weather = FactoryGirl.create(:weather)
    visit "/weathers/#{@weather.id}"
    click_link "Delete"

    expect(page).to have_content "Weather successfully deleted"
    expect(page).not_to have_content "Boston"
  end

  scenario "as a regular user who didn't create the weather" do
    @weather = FactoryGirl.create(:weather)
    @user = FactoryGirl.create(:user)
    login_as(@user)
    visit "/weathers/#{@weather.id}"

    expect(page).not_to have_link "Delete"
  end
end

feature "Deleting a review " do
  scenario "logged in as admin" do
    @user = FactoryGirl.create(:user, role: "admin")
    login_as(@user)
    @review = FactoryGirl.create(:review)
    visit "/weathers/#{@review.weather.id}"

    within("#weather_reviews") do
      click_link "Delete"
    end

    expect(page).to have_content "Review successfully deleted"
  end

  scenario "as a regular user who didn't create the review" do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    @review = FactoryGirl.create(:review)
    visit "/weathers/#{@review.weather.id}"

    expect(page).not_to have_link "Delete"
  end
end
