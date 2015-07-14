class AddBannedFlagToMembers < ActiveRecord::Migration
  def change
    add_column :members, :banned, :boolean, :default => false
  end
end
