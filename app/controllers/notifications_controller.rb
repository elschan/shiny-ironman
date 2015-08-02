class NotificationsController < ApplicationController
  def edit
    notification = Notification.find(params[:id].to_i)
    if member_signed_in? && ( current_member.id == notification.member_id )
      notification.update(seen: true)
      redirect_to post_path(notification.post_id) + '/#comment_' + notification.comment_id.to_s
    else
      redirect_to '/'
    end
  end
end