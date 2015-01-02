require "rails_helper"

feature "User deletes an existing review", %{
  As an authenticated user
  I want to delete an existing review
  So that the review can longer be viewed
  } do
  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario "clicking delete button" do
    weather = FactoryGirl.create(:weather)
    review = FactoryGirl.create(:review)
    review.weather_id = weather.id
    review.save
    visit "/weathers/#{weather.id}"

    within("div#weather_reviews") do
      click_on "Delete"
    end

    expect(page).to have_content "Review successfully deleted"
    expect(page).not_to have_content review.comment
  end
end
