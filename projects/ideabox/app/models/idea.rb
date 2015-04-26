class Idea < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :idea_categories
  has_many :categories, through: :idea_categories

  has_many :ideas_images
  has_many :images, through: :ideas_images
end
