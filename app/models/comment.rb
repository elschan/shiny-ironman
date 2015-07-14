class Comment < ActiveRecord::Base
  has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to :parent_comment, class_name: "Comment"
  belongs_to :post

  validates :text, length: { minimum: 10 }
end
