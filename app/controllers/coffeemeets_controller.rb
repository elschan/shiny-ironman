class CoffeemeetsController < ApplicationController
before_action :authenticate_member!

  def new
    @member = Member.find(params[:member_id])
    @coffee = Coffeemeet.new
  end

  def create
    @coffee = Coffeemeet.new(coffeemeet_params)
    @coffee.inviter_id = current_member.id
    if @coffee.save
      redirect_to member_path(@coffee.invitee_id)

    else
      flash[:notice] = "Something went wrong. Try again"
      redirect_to member_path(@coffee.invitee_id)
    end
  end

  def edit
    @coffee = Coffeemeet.find(params[:id])
  end

  def remove
    @coffee = Coffeemeet.find(params[:id])
    if current_member.id == @coffee.inviter_id
      @coffee.inviter_hide = true
      @coffee.save
    else
      @coffee.invitee_hide = true
      puts 'oops'
      @coffee.save
    end
    redirect_to member_path(current_member.id)
  end


  def update
    @coffee = Coffeemeet.find(params[:id])
    if @coffee.confirmed
      flash[:notice] = "This coffee's already been confirmed!"
      redirect_to member_path(current_member.id)
    else
      if @coffee.update_attributes(coffeemeet_params)
        if @coffee.confirmed
          Member.find(@coffee.invitee_id).increment!(:coffeepoints)
          Member.find(@coffee.inviter_id).increment!(:coffeepoints)
          redirect_to member_path(current_member.id)
        elsif @coffee.accepted
        redirect_to member_path(current_member.id)
        else 
        redirect_to member_path(current_member.id)
        end
      else
        render :edit
      end
    end
  end

protected
  def coffeemeet_params
    params.require(:coffeemeet).permit( :location, :invite_blurb, :invite_accept, :accepted, :confirmed, :invitee_id, :invite_blurb_contact, :invite_accept_contact )
  end

end
