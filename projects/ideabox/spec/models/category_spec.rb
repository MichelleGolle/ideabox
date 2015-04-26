require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(first_name: "Michelle", last_name: "Golle", username: "mg", password: "password") }
  let(:category) { Category.new(name: "something") }

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

end
