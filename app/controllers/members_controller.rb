class MembersController < ApplicationController
  # CRUD
  # list show new edit create save update delete
  # responding to requests which are routes or pages
  # registering for the first time
  # before_filter :restrict_only_invited_members 
    before_action :authenticate_member!, :except =>[:show]
    #REMEMBER VALIDATIONS BEFORE DEPLOY FOR UNIQUENESS AND PRESENCE


  def restrict_only_invited_members
    redirect_to :root if current_member.invitation_accepted_at.blank?
  end

  def show
    @member = Member.find(params[:id])
    @posts = Post.where("member_id = ?",@member.id)
    @coffees_invited_to = Coffeemeet.where("invitee_id = ?", @member.id).reverse
    @coffees_waiting_for = Coffeemeet.where("inviter_id = ?", @member.id).reverse
    @coffees = Coffeemeet.where("invitee_id = ? or inviter_id = ?",@member.id, @member.id).reverse
    @coffee = Coffeemeet.new
    @post = Post.new
  end

  def index
    @members = Member.all
    @signups = Signup.all
  end

  def new
      # render form
      # should also create a new profile.. for this user QUESTION ?
    @member = Member.new
  end

  def create
    # makes a new user with the data from the form on the "new" thing
    @member = Member.create(params)
  end

  # change member details
  def edit
    @member = Member.find(params[:id])
  end

  def update
    binding.pry
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:alert] = "Profile updated!"
      redirect_to member_path(current_member)
    else
      flash[:alert] = "An error occured, please try again"
      redirect_to edit_member_path(current_member.id)
    end
  end

  def ban
    @member = Member.find(params[:id])
    @member.toggle!(:banned)
    @member.save
    redirect_to members_path
  end
  # quit your account
  def destroy
    @member = Member.find(params[:id])
     # flash[:alert] = " #{@member.username}' successfully deleted."
    @member.destroy
   
    redirect_to members_path
  end

  protected
  def member_params
    params.require(:member).permit(:blurb, :location, :fave_coffee, :open_to_irl, :fullname, :username)
  end

end
