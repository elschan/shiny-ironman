module PostsHelper
  def post_time_ago(post)
    post.created_at
  end
end
