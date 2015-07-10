class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :member
      t.integer :parent_id
      t.string :type
      t.timestamps
    end
  end
end
