class MembersController < ApplicationController

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
    if params[:search]
      @nearby_members = Member.where("location ILIKE ?", "%#{params[:search]}%").where(open_to_irl: true).where("id != ?", current_member.id)
    end
    
    @members = Member.all.where("confirmed_at IS NOT NULL")
    @unconfirmed = Member.all.where("confirmed_at IS NULL")
    @signups = Signup.all.where("accepted IS false")
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(params)
  end

  # change member details
  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:notice] = "Profile updated!"
      redirect_to member_path(current_member)
    else
      if @member.errors.any?
        flash[:notice] = @member.errors.full_messages.join(", ")
      else
      flash[:notice] = "Something went wrong - please try again!"
      end
      redirect_to member_path(current_member)
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
