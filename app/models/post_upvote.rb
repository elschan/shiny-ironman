class PostUpvote < Upvote
  belongs_to :post, foreign_key: 'parent_id'
end
