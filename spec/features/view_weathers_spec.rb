require 'rails_helper'

feature 'User views all weathers', %Q{
  As an authenticated user
  I want to view a list of weathers
  So that I can pick a weather to review
  } do

  scenario 'from the index page' do
    FactoryGirl.create_list(:weather, 7)

    visit '/weathers'

    expect(page).to have_content "Boston"
    page.should have_css("p strong", count: 4)
    expect(page).to have_content "Next"

  end
end

feature 'User views details page', %Q{
  As an authenticated user
  I want to view the details about an item
  So that I can get more information about it
} do
  scenario 'from a details page' do
    weather = FactoryGirl.create(:weather)
    visit "/weathers/#{weather.id}"

    expect(page).to have_content weather.city
    expect(page).to have_content weather.state
    expect(page).to have_content weather.date.strftime("%B %d %Y")
    expect(page).to have_content weather.conditions
    expect(page).to have_content weather.feel
  end
end
