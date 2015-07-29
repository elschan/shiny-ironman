module ApplicationHelper
  def get_notifications
    notifications = current_member.notifications.where("seen = false").order("created_at")
  end

  def get_notification_count 
    current_member.notifications.where("seen = false").count
  end

  def get_actor_name(actor_id)
    Member.find(actor_id).username
  end

  def get_comment_stub(comment_id)
    Comment.find(comment_id).text
  end
  
  def get_post_stub(post_id)
    Post.find(post_id).title
  end
end
