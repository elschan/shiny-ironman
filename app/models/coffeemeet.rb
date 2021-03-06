class Coffeemeet < ActiveRecord::Base
  belongs_to :inviter, class_name: "Member"
  belongs_to :invitee, class_name: "Member"
  validates :invite_blurb, presence: true
  

  def had_coffee_with(me)
    if self.inviter_id == me.id
      Member.find(self.invitee_id)
    else 
      Member.find(self.inviter_id)
    end
  end




end
