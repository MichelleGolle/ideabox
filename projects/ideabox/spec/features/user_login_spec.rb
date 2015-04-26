require 'rails_helper'

RSpec.describe "user login" do
  context "with valid credentials" do
    it "shows user dashboard" do
      User.create(first_name: "Test", last_name: "Lastname", username: "testuser", password: "password", password_confirmation: "password")
      visit login_path
      fill_in "session[username]", with: "testuser"
      fill_in "session[password]", with: "password"
      click_button "Login"

      expect(page).to have_content("Welcome, Test!")
    end
  end

  context "without being registered" do
    it "gives error message" do
      visit login_path
      fill_in "session[username]", with: "testuser"
      fill_in "session[password]", with: "password"
      click_button "Login"
      expect(page).to have_content("Invalid login")
    end
  end

  context "registered but invalid password" do
    it "gives error message" do
      User.create(first_name: "Test", last_name: "Lastname", username: "testuser", password: "password", password_confirmation: "password")
      visit login_path
      fill_in "session[username]", with: "testuser"
      fill_in "session[password]", with: "pass"
      click_button "Login"

      expect(page).to have_content("Invalid login")
    end
  end


end
