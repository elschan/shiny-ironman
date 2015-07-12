class PostUpvote < Upvote
  belongs_to :post, foreign_key: 'parent_id'

  # TODO: refactor and put in the Upvote model
  # after save, update upvote count in the correct table
  after_save :update_total_post_upvotes

  protected

  def update_total_post_upvotes
    binding.pry
  end
end
