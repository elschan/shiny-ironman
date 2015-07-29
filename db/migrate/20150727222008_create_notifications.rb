class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :member
      t.integer :actor_id
      t.string :action
      t.integer :comment_id
      t.integer :post_id
      t.boolean :seen, default: false
      t.timestamps
    end
  end
end
