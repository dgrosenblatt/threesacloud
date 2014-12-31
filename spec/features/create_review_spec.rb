require "rails-helper"

Rspec.features "User wants to add a new review to a weather submission " do
  
  scenario "user properly enters a new review" do
    weather = FactoryGirl.create(:weather)
    visit "/weathers/#{weather.id}"

    fill_in :comment with "Man it's cold!"
    select("2", :from => "Select Box")
    click_on("Submit")

    expect(page).to have_content("Man it's cold!")
    expect(page).to have_content("2")
  end

  scenario "user enters invalid info" do
    weather = FactoryGirl.create(:weather)
    visit "/weathers/#{weather.id}"
    click_on("Submit")

    expect(page).to have_content("the review can't be blank")
    expect(page).to have_content("a rating must be selected")
  end


end