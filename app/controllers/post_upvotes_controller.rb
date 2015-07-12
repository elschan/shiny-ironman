class PostUpvotesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    
  end
end
