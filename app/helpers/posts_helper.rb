module PostsHelper
  def post_time_ago(post)
    post.created_at
  end

  def tag_links(tags)
  tags.split(" ").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(" ") 
  end
end
