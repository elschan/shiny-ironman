class CoffeemeetsController < ApplicationController

  def new
    @member = Member.find(params[:member_id])
    @coffee = Coffeemeet.new
  end

  def create
    @coffee = Coffeemeet.new(coffeemeet_params)
    @coffee.inviter_id = current_member.id
    if @coffee.save
      flash[:notice] = "Invite for coffee sent! #{@coffee.inspect}"
      redirect_to member_path(@coffee.invitee_id)

    else
      flash[:notice] = "Something went wrong. Try again"
      redirect_to member_path(@coffee.invitee_id)
    end
  end

  def edit
    @coffee = Coffeemeet.find(params[:id])
    
  end

  def update
    @coffee = Coffeemeet.find(params[:id])
    if @coffee.update_attributes(coffeemeet_params)
      if @coffee.accepted
      redirect_to member_path(params[:id])
      else 
      redirect_to member_path(current_member.id)
      end
    else
      render :edit
    end
  end

protected
  def coffeemeet_params
    params.require(:coffeemeet).permit( :location, :invite_blurb, :invite_accept, :accepted, :confirmed, :invitee_id, :invite_blurb_contact, :invite_accept_contact )
  end

end
