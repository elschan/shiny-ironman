class InvitationsController < Devise::InvitationsController

  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?
    yield resource if block_given?

    if resource_invited
      binding.pry
      if is_flashing_format? && self.resource.invitation_sent_at
        set_flash_message :notice, :send_instructions, :email => self.resource.email
        flash[:notice] = "You've invited #{self.resource.email}!"
      end
      respond_with resource, :location => member_path(current_member.id)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  def edit
    resource.invitation_token = params[:invitation_token]
    member = Member.find(resource.invited_by_id)
    member.increment!(:reputation)
    render :edit
  end



end
