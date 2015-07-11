class PostsController < ApplicationController
  def index
    @posts = Post.all
    # automatically serves /posts and @posts is available to that page
  end

  def new
    @post = Post.new
    # automatically serves /posts/new and @post is available to that page
    # /posts/new is a form
  end

  def create
    # catches the post request to posts/new
    # save a new post using params hash
    # redirect to posts index
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
    params.require(:title).permit()

end
