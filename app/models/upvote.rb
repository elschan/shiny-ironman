class Upvote < ActiveRecord::Base
  belongs_to :member

  # before save, validate that the member_id/parent_id/type is unique.
  # This is kind of hair-brained and might not work.
  validates :member_id, uniqueness: {scope: [:parent_id, :type]}
  
end
