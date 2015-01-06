require 'rails_helper'

feature "Admin views a list of users" do
  scenario "while logged in as admin" do
    @user = FactoryGirl.create(:user, role: "admin")
    FactoryGirl.create_list(:user, 5)
    login_as(@user)
    visit admin_users_path

    expect(page).to have_content "All Users"
    expect(page).to have_content "example.com"
  end

  scenario "while logged in as a regular member" do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    visit admin_users_path
    
    expect(page).to have_content "You must be an admin to view that page."
  end
end
