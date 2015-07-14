class CommentsController < ApplicationController

  def new
    # This should be called when reply is clicked... ?
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new()
    @comment.member_id = current_member.id

    # If comment is a reply
    if params[:parent_id]
      @comment.parent_comment_id = params[:parent_id].to_i
      @comment.text = params[:text]
    else
      @comment.post_id = params[:post_id].to_i
      @comment.text = params[:comment][:text]
    end

    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      errors[:base] << "There has been a problem"
      render post_path(@comment.post_id)
    end

    # binding.pry
  end
end
