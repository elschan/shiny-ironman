class Member < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 4..15 }
  has_secure_password
end
