require 'rails_helper'

RSpec.describe "user can be created" do
  context "with valid info" do

    let(:user) { User.new(first_name: "Test",
                             last_name: "User",
                             username: "TestUser",
                             role: 0,
                             password: "Password") }

    it "creates user" do
      visit new_user_path
      fill_in "user[first_name]", with: "Test"
      fill_in "user[last_name]", with: "User"
      fill_in "user[username]", with: "TestUser"
      fill_in "user[password]", with: "Password"
      fill_in "user[password_confirmation]", with: "Password"
      click_link_or_button "Create User"

      expect(page).to have_content("Welcome, Test!")

    end
  end
end
