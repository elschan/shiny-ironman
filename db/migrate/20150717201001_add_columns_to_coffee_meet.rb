class AddColumnsToCoffeeMeet < ActiveRecord::Migration
  def change
      add_column :coffeemeets, :inviter_id, :integer
      add_column :coffeemeets, :invitee_id, :integer
  end
end
