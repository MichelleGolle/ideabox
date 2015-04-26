class Image < ActiveRecord::Base
  validates :url, presence: true

  has_many :ideas_images
  has_many :ideas, through: :ideas_images
end
