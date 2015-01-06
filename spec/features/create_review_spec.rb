require "rails_helper"

feature "User wants to add a new review to a weather submission " do
  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)

    end

    scenario "user properly enters a new review"  do
      weather = FactoryGirl.create(:weather)

      visit "/weathers/#{weather.id}"

      fill_in "Comment", with: "Man it's cold!"
      select(2, :from => "Rating")

      click_on("Submit")

      expect(page).to have_content("Man it's cold!")
      expect(page).to have_content("2")
    end

    scenario "user creates multiple reviews" do

      weather = FactoryGirl.create(:weather)
      reviews = FactoryGirl.create_list(:review, 12, weather_id: weather.id)

      visit "/weathers/#{weather.id}"

      expect(page).to have_content("Next")
    end


    scenario "user enters invalid info" do
      weather = FactoryGirl.create(:weather)
      FactoryGirl.create(:review, weather_id: weather.id)

      visit "/weathers/#{weather.id}"
      click_on("Submit")

      expect(page).to have_content("Comment can't be blank")

    end
  end

end
