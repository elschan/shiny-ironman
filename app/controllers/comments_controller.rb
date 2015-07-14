class CommentsController < ApplicationController
  def create
    @comment = Comment.new()
    @comment.post_id = params[:post_id].to_i
    @comment.text = params[:comment][:text]
    @comment.member_id = current_member.id

    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      errors[:base] << "There has been a problem"
      render post_path(@comment.post_id)
    end

  #   binding.pry

  end
end
