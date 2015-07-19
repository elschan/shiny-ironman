class AddBlurbToMember < ActiveRecord::Migration
 def change
      add_column :members, :blurb, :string
      add_column :members, :favorite_coffee_drink, :string
  end
end
