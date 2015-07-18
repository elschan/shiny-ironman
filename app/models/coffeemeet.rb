class Coffeemeet < ActiveRecord::Base
  belongs_to :inviter, class_name: "Member"
  belongs_to :invitee, class_name: "Member"


  def had_coffee_with(me)
    if self.inviter_id == me.id
      Member.find(self.invitee_id).username
    else 
      Member.find(self.inviter_id).username
    end
  end

end
