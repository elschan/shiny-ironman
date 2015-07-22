class Signup < ActiveRecord::Base
  validates :email, presence: true
  validates :application, presence: true, length: { minimum: 1 }
end
