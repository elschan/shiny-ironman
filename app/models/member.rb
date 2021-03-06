class Member < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true, uniqueness: true
  validates :fullname, presence: true
  validates_length_of :blurb, :maximum => 255

  
  acts_as_voter

  # validates :password_digest, presence: true
  has_many :posts
  has_many :comments
  has_many :coffeemeets
  has_many :notifications

  def to_param
    username
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      conditions[:email].downcase! if conditions[:email]
      conditions[:username].downcase! if conditions[:username]
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
