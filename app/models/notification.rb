class Notification < ActiveRecord::Base
  has_many :notification_objects
end