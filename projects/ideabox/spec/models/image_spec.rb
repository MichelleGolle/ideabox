require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:user) { User.create(first_name: "Michelle", last_name: "Golle", username: "mg", password: "password") }
  let(:image) { Image.new(url: "http://i.huffpost.com/gen/2364914/images/o-GRUMPY-CAT-facebook.jpg") }

  it 'is valid' do
    expect(image).to be_valid
  end

  it 'is invalid without a url' do
    image.url = nil
    expect(image).to_not be_valid
  end

end
