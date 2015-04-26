require "rails_helper"

RSpec.describe 'admin categories' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: "Admin",
                  last_name: "Admin",
                  username: "admin",
                  password: "password",
                  role: 1)
    end

    it 'displays categories' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path

      fill_in "category[name]", with: "My category"
      click_button "Create Category"

      expect(page).to have_content('My category')
    end

  end

  context 'regular user logged in' do
    let(:guest) do
      User.create(first_name: "michelle",
                  last_name: "golle",
                  username: "mg",
                  password: "password",
                  role: 0)
    end

    it 'does not display categories' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(guest)
      visit admin_categories_path
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end

  end
end
