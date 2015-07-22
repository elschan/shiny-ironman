class AddNameToMembers < ActiveRecord::Migration
  def change
      add_column :members, :fullname, :string
  end
end
