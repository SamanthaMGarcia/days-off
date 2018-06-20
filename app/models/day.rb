class Day < ActiveRecord::Base
  has_many :user_days
  has_many :users, through: :user_days
end
