class PostsController < ApplicationController

  before_action :authenticate_member!

  def index
    # TODO sort chronologically or by upvotes/time
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id

    if @post.save
      @post.upvote_by current_member
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])

    # Can't edit the post unless it's yours.
    if @post.member_id == current_member.id
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post '#{@post.title}' successfully deleted."
    redirect_to posts_path
  end

  def vote
    @post = Post.find(params[:id])
    if current_member.voted_for? @post
      @post.unvote_by current_member
    else
      @post.upvote_by current_member
    end
    redirect_to :back
  end

  protected

  def post_params
    params.require(:post).permit(:title, :url, :text)
  end
end
