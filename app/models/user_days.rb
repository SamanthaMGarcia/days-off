class UserDays < ActiveRecord::Base
  belongs_to :user
  belongs_to :day
end
