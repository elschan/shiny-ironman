class PostsController < ApplicationController
  def index
    # sort chronologically or by upvotes/time
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "#{@post.title} was submitted successfully."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    # serve /posts/ID/edit and put a form on the page
  end

  def update

    # save post params
  end

  def destroy
    Post.find(params[:id]).destroy
  end

  protected

  def post_params
    params.require(:post).permit(:title, :url, :text)
  end
end
