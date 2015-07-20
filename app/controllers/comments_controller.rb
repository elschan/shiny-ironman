class CommentsController < ApplicationController
before_action :authenticate_member!
  def new
    # This should be called when reply is clicked... ?
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new()
    @comment.member_id = current_member.id

    # TODO is there a better way to do this post_id than a hidden_field (for replies)
    # See _comments.html.erb
    # binding.pry

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
      Post.find(params[:post_id].to_i).increment!(:comment_count)
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
    @member = Member.find_by(@comment.member_id)
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
