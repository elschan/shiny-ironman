module InvitationsHelper
  def not_invited_yet(applicant, unconfirmed, members)
    !unconfirmed.any? { |member| member.email == applicant.email } &&
    !members.any? { |member| member.email == applicant.email }
  end

  def invited_and_unconfirmed(applicant, unconfirmed)
    unconfirmed.any? { |member| member.email == applicant.email }
  end

  def member_confirmed(applicant, members)
    members.any? { |member| member.email == applicant.email }
  end
end
