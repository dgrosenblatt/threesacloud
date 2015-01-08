require "rails_helper"

feature "User wants to add a new review to a weather submission " do
  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)

    end

    scenario "user properly enters a new review" , %{
      As a registered user
      I want post a review
      So that I can share my opinion with other people
      }, focus: true do
      @weather = FactoryGirl.create(:weather)
      ActionMailer::Base.deliveries = []

      visit "/weathers/#{@weather.id}"

      fill_in "Comment", with: "Man it's cold!"
      select(2, from: "Rating")

      click_on("Submit")

      expect(page).to have_content("Man it's cold!")
      expect(page).to have_content("2")
    end

    scenario "user creates multiple reviews" do

      weather = FactoryGirl.create(:weather)
      FactoryGirl.create_list(:review, 12, weather_id: weather.id)

      visit weather_path(weather.id)

      expect(page).to have_content("Next")
    end

    scenario "user properly enters a new review", %{
      As a registered user
      I want to be notified when someone posts a review
      So that I can read that review
      }, focus: true do
        @weather = FactoryGirl.create(:weather)
        ActionMailer::Base.deliveries = []

        visit "/weathers/#{@weather.id}"

        fill_in "Comment", with: "Man it's cold!"
        select(2, from: "Rating")

        click_on("Submit")

        expect(ActionMailer::Base.deliveries.size).to eql(1)
        last_email = ActionMailer::Base.deliveries.last
        expect(last_email).to deliver_to(User.find(@weather.user_id))
        expect(last_email).to have_subject("A review has been posted to your weather")
        expect(last_email).to have_body_text("Greetings,
          #{User.find(@weather.user_id).email} Your submitted weather
          observation has been commented on by another user.
          Please visit your submission to see the review.")

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
