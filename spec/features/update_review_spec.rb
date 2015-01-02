require "rails_helper"

feature "User updates an existing review", %{
  As an authenticated user
  I want to update an existing review
  So that others can view that update
  } do
  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario "with valid data" do
    weather = FactoryGirl.create(:weather)
    review = FactoryGirl.create(:review)
    review.weather_id = weather.id
    review.save
    visit "/weathers/#{weather.id}"
    click_on "Edit Review"

    fill_in "Comment", with: "Updated comment"
    click_on "Submit"

    expect(page).to have_content "Review successfully updated"
    expect(page).to have_content "Updated comment"
  end

  scenario "with invalid data" do
    weather = FactoryGirl.create(:weather)
    review = FactoryGirl.create(:review)
    review.weather_id = weather.id
    review.save
    visit "/weathers/#{weather.id}"
    click_on "Edit Review"

    fill_in "Comment", with: ""

    click_on "Submit"

    expect(page).not_to have_content "Review successfully updated"
    expect(page).to have_content "Comment can't be blank"
  end

end
