class DropUpvotesTable < ActiveRecord::Migration
  def up
    drop_table :upvotes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
