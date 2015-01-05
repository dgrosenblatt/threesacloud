require "rails_helper"
require "carrierwave/test/matchers"

feature "user registers and adds a profile photo" do

  # Acceptance Criteria:
  # * I must be able to upload a file and be able to see it after upload

  scenario "user uploads a profile pic during registration" do
    visit new_user_registration_path

    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    attach_file "Profile photo", File.join(Rails.root, "spec/support/images/example.jpg")

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to have_css("img[src*='uploads']")
  end

end
