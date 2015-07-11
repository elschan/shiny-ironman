class AddProfileColumnsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :invite_count, :integer
    add_column :members, :reputation, :integer
  end
end
