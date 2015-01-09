require "rails_helper"

feature "User updates a vote" do
  scenario "while logged in" do
    @review = FactoryGirl.create(:review)
    @weather = @review.weather
    @user = @review.user
    login_as(@user)

    visit "/weathers/#{@weather.id}"
    click_button "+"
    click_link "ReVote"

    expect(page).to have_content "Vote Changed"
    expect(page).to have_content "-1"
    expect(page).not_to have_content "+1"
  end

  scenario "without logging in" do
    @review = FactoryGirl.create(:review)
    @weather = @review.weather
    @user = @review.user

    visit "/weathers/#{@weather.id}"

    expect(page).not_to have_content "Change my vote"
  end
end
