class InvitationsController < Devise::InvitationsController

  def edit
    resource.invitation_token = params[:invitation_token]
    member = Member.find(resource.invited_by_id)
    member.increment!(:reputation)
    render :edit
  end

end
