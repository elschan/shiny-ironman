class CommentsController < ApplicationController
before_action :authenticate_member!
  def new
    # This should be called when reply is clicked... ?
    @comment = Comment.new()
  end

  def create
    # Create a notification with the details
    # If comment has a parent_id, comment is a reply
    @comment = Comment.new()
    @comment.member_id = current_member.id

    if params[:parent_id]
      member_to_notify = Comment.find(params[:parent_id].to_i).member_id
      if member_to_notify != current_member.id
        n = Notification.create(
          member_id: member_to_notify,
          actor_id: current_member.id,
          action: "reply",
          comment_id: params[:parent_id].to_i, # the parent comment
          post_id: params[:post_id].to_i
          )
      end
    else
      member_to_notify = Post.find(params[:post_id].to_i).member_id
      if member_to_notify != current_member.id
        n = Notification.create(
          member_id: member_to_notify,
          actor_id: current_member.id,
          action: "comment",
          comment_id: @comment.id,  # the current comment
          post_id: params[:post_id].to_i
          )
      end
    end

    # TODO is there a better way to do this post_id than a hidden_field (for replies)
    # See _comments.html.erb

    # If comment is a reply
    if params[:parent_id]
      @comment.parent_comment_id = params[:parent_id].to_i
      @comment.text = params[:text] 
    else
      @comment.post_id = params[:post_id].to_i
      @comment.text = params[:comment][:text]
    end

    if @comment.save
      # TODO Fix this, it's broken and doesn't take params in this way
      Post.find(params[:post_id]).increment!(:comment_count)
      redirect_to post_path(@comment.get_post_id)
    else
      # TODO how to I print the error from here? Comment save fails when the
      # comment text is too dang short
      # find error here : @comment.errors
      flash[:error] = "you can't have an empty comment"
      redirect_to post_path(params[:post_id].to_i)

      # render post_path(@comment.post_id)
    end
    # binding.pry
  end

  def vote
    @comment = Comment.find(params[:id])
    @member = Member.find(@comment.member_id)
    if current_member.voted_for? @comment
      @comment.unvote_by current_member
      @member.decrement!(:reputation, 2)
    else
      @comment.upvote_by current_member
      @member.increment!(:reputation, 2)
    end

    respond_to do |format|
      # TODO format.html
      format.json do
        response = { vote_count: @comment.get_upvotes.size, voted_for: current_member.voted_for?(@comment) }
        render json: response
      end
    end
  end
end
