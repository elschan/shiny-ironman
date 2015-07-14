module MembersHelper


  def total_posts_posted
    total_posts = Post.where("member_id = #{self.id}").count
  end

  def total_upvotes_earned
    total_upvotes = 0
     Post.where("member_id = #{self.id}").each do |post|
      total_upvotes += post.get_upvotes.size
    end
    return total_upvotes
  end

  
end
