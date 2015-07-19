class AddBlurbToMembers < ActiveRecord::Migration
  def change
      add_column :members, :blurb, :string
      add_column :members, :fave_coffee, :string
  end
end
