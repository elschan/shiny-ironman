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

      # Create a coffee notification for invite
      n = Notification.create(
        member_id: @coffee.invitee_id,
        actor_id: @coffee.inviter_id,
        coffee_id: @coffee.id,
        action: "invite",
      )

      flash[:notice] = "Coffee invite sent!"
      redirect_to member_path(@coffee.invitee)
    else
      if @coffee.invite_blurb.length < 20
        flash[:notice] = "You need to say something! (more than 20 char.)"
      else
      flash[:notice] = "Something went wrong. Try again"
      end
      redirect_to new_member_coffeemeet_path(@coffee.invitee)
    end
  end

  # /coffeemeets/:id/edit
  # Sends back the contents of the invite modal
  def edit
    @coffee_accept = Coffeemeet.find(@coffee.id)
    layout false # ask rails not to render the layout
  end

  def remove
    @coffee = Coffeemeet.find(params[:id])
    if current_member.id == @coffee.inviter_id
      @coffee.inviter_hide = true
      @coffee.save
    else
      @coffee.invitee_hide = true
      @coffee.save
    end
    redirect_to member_path(current_member)
  end


  def update
    @coffee_accept = Coffeemeet.find(params[:id])
    if @coffee_accept.confirmed
      flash[:notice] = "This coffee's already been confirmed!"
      redirect_to member_path(current_member)
    else
      if @coffee_accept.update_attributes(coffeemeet_params)
      
        if @coffee_accept.confirmed
          Member.find(@coffee_accept.invitee_id).increment!(:coffeepoints)
          Member.find(@coffee_accept.inviter_id).increment!(:coffeepoints)

        #   redirect_to member_path(current_member)
        # elsif @coffee_accept.accepted
        # redirect_to member_path(current_member)
        # else 
        # redirect_to member_path(current_member)

          redirect_to member_path(current_member.id)
        else
          # Create a notification for RSVP
          n = Notification.create(
            member_id: @coffee_accept.inviter_id,
            actor_id: @coffee_accept.invitee_id,
            coffee_id: @coffee_accept.id,
            action: @coffee_accept.accepted? ? "invite_accept" : "invite_decline",
          )
          redirect_to member_path(current_member.id)
        end
      else
        #we probably want to redirect instead somewhere
        render :edit
      end
    end
  end

protected
  def coffeemeet_params
    params.require(:coffeemeet).permit( :location, :invite_blurb, :invite_accept, :accepted, :confirmed, :invitee_id, :invite_blurb_contact, :invite_accept_contact )
  end

end
