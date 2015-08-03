class Comment < ActiveRecord::Base
  has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to :parent_comment, class_name: "Comment"
  belongs_to :post

  acts_as_votable

  validates :text, length: { minimum: 1 }

  def get_commenter_name
    Member.find(member_id).username
  end

  def get_commenter_location
    Member.find(member_id).location
  end

  def get_post_id
    if post_id
      post_id
    else
      Comment.find(parent_comment_id).get_post_id
    end
  end
end
