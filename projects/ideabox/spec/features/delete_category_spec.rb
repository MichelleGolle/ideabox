require 'rails_helper'

RSpec.describe "admin can delete categories" do
  context "with valid attributes" do
      let(:admin) { User.create(first_name: "admin",
                             last_name: "admin",
                             username: "admin",
                             role: 1,
                             password: "password") }
      it "will delete the reward" do

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

       Category.create(name: "something")

       visit admin_categories_path

       click_link "delete"

       expect(page).to_not have_content("something")
     end
   end
end
