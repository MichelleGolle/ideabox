require 'rails_helper'

RSpec.describe "User creates an idea" do
  context "with valid attributes" do

    it "saves and displays the idea" do
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
      click_link_or_button "Create Idea"

      expect(page).to have_content('My Idea')
      expect(page).to have_content('A Description')


      click_link "Delete"

       expect(page).to_not have_content("My Idea")

    end
  end
end
