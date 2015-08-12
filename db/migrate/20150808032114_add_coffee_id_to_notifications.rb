class AddCoffeeIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :coffee_id, :integer
  end
end
