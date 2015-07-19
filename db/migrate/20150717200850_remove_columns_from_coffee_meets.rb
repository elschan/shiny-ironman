class RemoveColumnsFromCoffeeMeets < ActiveRecord::Migration
  def change
    remove_column :coffeemeets, :inviter_id, :integer
    remove_column :coffeemeets, :invitee_id, :integer
  end
end
