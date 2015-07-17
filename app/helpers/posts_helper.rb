module PostsHelper
  def get_preview(post)
    if post.text.length > 160
      post.text[0..160] + '...'
    else
      post.text
    end
  end
end
