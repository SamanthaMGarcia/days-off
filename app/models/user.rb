class User < ActiveRecord::Base
  has_secure_password
  validates :work_email, uniqueness: true
  validates :work_email, presence: true
end
