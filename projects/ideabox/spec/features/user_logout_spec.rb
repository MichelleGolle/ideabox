require 'rails_helper'

RSpec.describe "user logout" do
  it "logs out" do
    User.create(first_name: "Test", last_name: "Lastname", username: "testuser", password: "password", password_confirmation: "password")

      visit login_path
      fill_in "session[username]", with: "testuser"
      fill_in "session[password]", with: "password"
      click_button "Login"

      expect(page).to have_content("Welcome, Test!")
      click_link "Logout"

      expect(page).to have_content("Successfully logged out")
  end
end
