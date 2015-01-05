require 'rails_helper'

# feature 'user registers', %Q{
#   As a new user I would like to add a profile picture
# } do

#   # Acceptance Criteria:
#   # * I must be able to upload a file and be able to see it after upload

#   scenario 'user uploads a profile pic during registration' do
#     visit new_user_registration_path

#     fill_in 'Email', with: 'john@example.com'
#     fill_in 'Password', with: 'password'
#     fill_in 'Password confirmation', with: 'password'
#     attach_file ('Image', '/path/to/image.jpg')

#     click_button 'Sign up'

#     require 'carrierwave/test/matchers'

#     expect(page).to have_content('Welcome! You have signed up successfully.')
#     expect(page).to have_content('Sign Out')
#     page.should have_xpath("/upload/user/link[@href='img.jpg']")
#   end

# end
