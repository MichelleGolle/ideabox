class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :ideas
  has_many :categories


  has_secure_password

  enum role: %w(default, admin)

  def admin?
    role == "admin"
  end
end
