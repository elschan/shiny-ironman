module PostsHelper
  def get_username(member_id)
    @member = Member.find(member_id)
    username = @member.username
  end

  def post_time_ago(post)
    post.created_at
  end
end
