require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:user) { User.create(first_name: "Michelle", last_name: "Golle", username: "mg", password: "password") }
  let(:idea) { Idea.new(title: "New Idea", description: "New Description") }

  it 'is valid' do
    expect(idea).to be_valid
  end

  it 'is invalid without a title' do
    idea.title = nil
    expect(idea).to_not be_valid
  end

  it 'is associated with a user' do
    expect(idea).to respond_to(:user)
  end

end
