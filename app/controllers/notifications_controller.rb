class NotificationsController < ApplicationController
  def edit
    notification = Notification.find(params[:id].to_i)
    notification.update(seen: true)
    redirect_to post_path(notification.post_id) + '/#comment_' + notification.comment_id.to_s
  end
end