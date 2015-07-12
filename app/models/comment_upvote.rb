class CommentUpvote < Upvote
  belongs_to :comment, foreign_key: 'parent_id'

  # after_save :update_total_comment_upvotes
end
