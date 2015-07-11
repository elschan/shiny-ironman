class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # validates :email, presence: true, uniqueness: true
  # validates :username, presence: true, uniqueness: true, length: { in: 4..15 }
  # validates :password_digest, presence: true
  has_many :posts
  has_many :comments
end
