class ChangeCoffeemeetColumn < ActiveRecord::Migration
  def change
    change_column :coffeemeets, :confirmed, :boolean, :default=>false
  end
end
