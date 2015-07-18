class AddHideInProfileForCoffee < ActiveRecord::Migration
  def change
      add_column :coffeemeets, :inviter_hide, :boolean, :default => false 
      add_column :coffeemeets, :invitee_hide, :boolean, :default => false
  end
end
