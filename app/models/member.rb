class Member < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 4..15 }
  validates :password_digest, presence: true
  has_many :posts
  has_many :comments
end
