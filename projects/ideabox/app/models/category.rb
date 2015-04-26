class Category < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :idea_categories
  has_many :ideas, through: :idea_categories

end
