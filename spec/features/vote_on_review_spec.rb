require 'rails_helper'

feature 'Voting on a review', %{
  As an authenticated user
  I want to vote on reviews
  So that I can express my opinion on whether the review was helpful
  } do

  before :each do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  scenario 'upvoting a review' do
    @review = FactoryGirl.create(:review)
    visit "/weathers/#{@review.weather_id}"
    click_on 'Upvote'

    expect(page).to have_content "+1"
    expect(page).to have_content "Thank you for voting."
  end

  scenario 'downvoting a review' do
    @review = FactoryGirl.create(:review)
    visit "/weathers/#{@review.weather_id}"
    click_on 'Downvote'

    expect(page).to have_content "-1"
    expect(page).to have_content "Thank you for voting."
  end
end
