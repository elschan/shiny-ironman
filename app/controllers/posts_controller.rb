class PostsController < ApplicationController

  before_action :authenticate_member!, :except =>[:index]

  def index
    # TODO sort chronologically or by upvotes/time
    if params[:search]
      @tags = []
      @posts = []
      tags = params[:search].downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
      tags.each do |tag|
        unless Tag.find_by(name: tag) == nil
        @tags << Tag.find_by(name: tag)
        end
      end
      @tags.each do |tag|
        @posts << tag.posts
      end
      @posts.flatten!
      @posts.uniq!
    elsif params[:tag]
      tag = Tag.find_by(name: params[:tag])
      @posts = tag.posts.uniq
      # @posts.order(created_at: :desc)


    else
    @posts = Post.all
    @posts.sort! { |p1, p2| p2.trending_value <=> p1.trending_value }
    # NAMESCOPE LATER FOR FASTER SORTING
  end
end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id

    if @post.save
      @post.upvote_by current_member
      current_member.increment!(:reputation)

      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new()
  end

  def edit
    @post = Post.find(params[:id])
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
    current_member.decrement!(:reputation)
    flash[:alert] = "Post '#{@post.title}' successfully deleted."
    redirect_to posts_path
  end


  def vote
    @post = Post.find(params[:id])
    @member = Member.find_by(@post.member_id)
    if current_member.voted_for? @post
      @post.unvote_by current_member
      @member.decrement!(:reputation, 2)
    else
      @post.upvote_by current_member
      @member.increment!(:reputation, 2)
    end

    respond_to do |format|
      # TODO format.html
      format.json do
        response = { vote_count: @post.get_upvotes.size, voted_for: current_member.voted_for?(@post) }
        render json: response
      end
    end
  end




  protected

  def post_params
    params.require(:post).permit(:title, :url, :text, :tag_list)
  end
end
