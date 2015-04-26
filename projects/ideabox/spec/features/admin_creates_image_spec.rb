require "rails_helper"

RSpec.describe 'admin images' do
  context 'with admin logged in' do

    let(:admin) do
      User.create(first_name: "Admin",
                  last_name: "Admin",
                  username: "admin",
                  password: "password",
                  role: 1)
    end

    it 'displays images' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_image_path

      fill_in "image[url]", with: "http://i.huffpost.com/gen/2364914/images/o-GRUMPY-CAT-facebook.jpg"
      click_button "Create Image"

      expect(page).to have_css("img[src*='http://i.huffpost.com/gen/2364914/images/o-GRUMPY-CAT-facebook.jpg']")
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

    it 'does not display images' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(guest)
      visit admin_images_path
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end

  end
end
