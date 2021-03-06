require 'rails_helper'

RSpec.describe "User adds category to idea" do
  context "with valid attributes" do

    it "saves and displays the idea category" do

      User.create(first_name: "admin",
                  last_name: "admin",
                  username: "admin",
                  password: "password",
                  role: 1)

      visit login_path

      fill_in "Username", with: "admin"
      fill_in "Password", with: "password"
      click_button "Login"

      visit new_admin_category_path
      click_link_or_button "Create Category"

      fill_in "Name", with: "Brilliant"

      click_link_or_button "Create Category"

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
      check 'Brilliant'
      click_link_or_button "Create Idea"

      expect(page).to have_content('My Idea')
      expect(page).to have_content('A Description')
      expect(page).to have_content('Brilliant')
    end

  end
end
