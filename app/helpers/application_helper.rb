module ApplicationHelper
  def member_has_unseen_notifications?
    get_notification_count > 0
  end
  
  def get_notifications
    notifications = current_member.notifications.where("seen = false").order("created_at DESC")
  end

  def get_notification_count 
    current_member.notifications.where("seen = false").count
  end

  def get_actor_name(actor_id)
    Member.find(actor_id).username
  end

  def get_comment_stub(comment_id)
    get_stub(Comment.find(comment_id).text)
  end
  
  def get_post_stub(post_id)
    get_stub(Post.find(post_id).title)
  end

  def get_stub(text)
    if text.length > 20
      return '"' + text[0...20] + '..."'
    else 
      return '"' + text + '"'
    end
  end
end
