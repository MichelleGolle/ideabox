require 'rails_helper'

RSpec.describe "admin can edit categories" do
  context "with valid attributes" do
    let(:admin) { User.create(first_name: "admin",
                           last_name: "admin",
                           username: "admin",
                           role: 1,
                           password: "password") }
    it "will edit the category" do

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     Category.create(name: "thing")

     visit admin_categories_path

     click_link "edit"

     fill_in "category[name]", with: "something"

     click_link_or_button "Update"

     expect(page).to have_content("something")

   end
  end
 end
