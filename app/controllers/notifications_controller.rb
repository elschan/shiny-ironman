class NotificationsController < ApplicationController
  def edit
    notification = Notification.find(params[:id].to_i)
    if member_signed_in? && ( current_member.id == notification.member_id )

      notification.update(seen: true)

      if notification.action == "reply" || notification.action == "comment"
        redirect_to post_path(notification.post_id) + '/#comment_' + notification.comment_id.to_s
      else
        redirect_to member_path(current_member.id)
      end
    else
      redirect_to '/'
    end
  end
end