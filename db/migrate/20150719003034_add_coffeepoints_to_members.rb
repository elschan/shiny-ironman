class AddCoffeepointsToMembers < ActiveRecord::Migration
  def change
      add_column :members, :coffeepoints, :integer, :default => 0
  end
end
