require "rails_helper"

feature "User updates a vote" do
  scenario "while logged in" do
    @review = FactoryGirl.create(:review)
    @weather = @review.weather
    @user = @review.user
    login_as(@user)

    visit "/weathers/#{@weather.id}"
    click_button "Upvote"
    click_link "Change my vote"

    expect(page).to have_content "Vote Changed"
    expect(page).to have_content "-1"
    expect(page).not_to have_content "+1"
  end
end
