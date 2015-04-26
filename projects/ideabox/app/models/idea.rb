class Idea < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :idea_categories
  has_many :categories, through: :idea_categories
end
