require 'rails_helper'

RSpec.describe "User adds image to idea" do
  context "with valid attributes" do

    it "saves and displays the idea image" do

      User.create(first_name: "admin",
                  last_name: "admin",
                  username: "admin",
                  password: "password",
                  role: 1)

      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "password"
      click_button "Login"

      visit new_admin_image_path
      click_link_or_button "Create Image"

      fill_in "Image URL", with: "http://i.huffpost.com/gen/2364914/images/o-GRUMPY-CAT-facebook.jpg"
      fill_in "Description", with: "Grumpy Cat"

      click_link_or_button "Create Image"

      click_link "Logout"

      visit new_user_path
      fill_in "user[first_name]", with: "Test"
      fill_in "user[last_name]", with: "User"
      fill_in "user[username]", with: "TestUser"
      fill_in "user[password]", with: "Password"
      fill_in "user[password_confirmation]", with: "Password"
      click_link_or_button "Create User"

      expect(page).to have_content("Welcome, Test!")

      visit login_path

      fill_in "Username", with: "TestUser"
      fill_in "Password", with: "Password"
      click_button "Login"


      visit new_idea_path

      fill_in "idea[title]", with: "My Idea"
      fill_in "idea[description]", with: "A Description"
      check "Grumpy Cat"
      click_link_or_button "Create Idea"

      expect(page).to have_content('My Idea')
      expect(page).to have_content('A Description')
      expect(page).to have_css("img[src*='http://i.huffpost.com/gen/2364914/images/o-GRUMPY-CAT-facebook.jpg']")
    end

  end
end
