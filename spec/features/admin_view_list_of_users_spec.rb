require 'rails_helper'

feature "Admin views a list of users" do
  scenario "while logged in as admin" do
    @user = FactoryGirl.create(:user, role: "admin")
    FactoryGirl.create_list(:user, 5)
    login_as(@user)
    visit "/admin/users"

    expect(page).to have_content "All Users"
    expect(page).to have_content "example.com"
  end
end
