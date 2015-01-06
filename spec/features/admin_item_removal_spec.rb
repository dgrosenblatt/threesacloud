require 'rails_helper'

feature "Deleting a user" do

  before do
    @user = FactoryGirl.create(:user, role: "admin")
    login_as(@user)
  end

  scenario "signed in as admin" do
    @member = FactoryGirl.create(:user, email: "troll@aol.com")
    visit "/admin/users"
    click_link "Delete account for troll@aol.com"

    expect(page).to have_content "Account for troll@aol.com has been deleted."
  end
end
