class CommentUpvote < Upvote
  belongs_to :comment, foreign_key: 'parent_id'
end
