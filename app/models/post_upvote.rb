class PostUpvote < Upvote
  belongs_to :post, foreign_key: 'parent_id'

  # TODO: refactor and put in the Upvote model
  # after save, update upvote count in the correct table
end
