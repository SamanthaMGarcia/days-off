class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  validates :username, presence: true

  has_many :user_days
  has_many :users, through: :user_days
end
