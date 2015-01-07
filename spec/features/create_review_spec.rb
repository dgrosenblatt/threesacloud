require "rails_helper"

feature "User wants to add a new review to a weather submission " do
  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user)

    end

    scenario "user properly enters a new review" ,focus: true do
      weather = FactoryGirl.create(:weather)
      ActionMailer::Base.deliveries = []

      visit "/weathers/#{weather.id}"

      fill_in "Comment", with: "Man it's cold!"
      select(2, :from => "Rating")

      click_on("Submit")

      expect(ActionMailer::Base.deliveries.size).to eql(1)
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email).to deliver_to(User.find(weather.user_id))
      expect(last_email).to have_subject("A review has been posted to your weather")


      expect(page).to have_content("Man it's cold!")
      expect(page).to have_content("2")
    end

    scenario "user enters invalid info" do
      weather = FactoryGirl.create(:weather)

      visit "/weathers/#{weather.id}"
      click_on("Submit")

      expect(page).to have_content("Comment can't be blank")

    end
  end

end
