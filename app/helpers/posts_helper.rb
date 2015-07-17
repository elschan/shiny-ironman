module PostsHelper
  def get_preview(post)
    if post.text.length > 160
      post.text[0..160] + '...'
    else
      post.text
    end
  end

  def tag_links(tags)
  tags.split(" ").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(" ") 
  end

  


end
