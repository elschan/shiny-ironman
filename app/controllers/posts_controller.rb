class PostsController < ApplicationController
  def index
    # TODO sort chronologically or by upvotes/time
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # @post = current_member.post.build(post_params)
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
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
    redirect_to posts_p
  end

  protected

  def post_params
    params.require(:post).permit(:title, :url, :text)
  end
end
