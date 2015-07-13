class MembersController < ApplicationController
  # CRUD
  # list show new edit create save update delete
  # responding to requests which are routes or pages
  # registering for the first time
  # before_filter :restrict_only_invited_members 

  def restrict_only_invited_members
    redirect_to :root if current_member.invitation_accepted_at.blank?
  end

  def show
      @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
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

  end

  def update
    @member = Member.find(params[:id])
    @member.update_attributes(params)
  end

  # quit your account
  def destroy

  end
end
