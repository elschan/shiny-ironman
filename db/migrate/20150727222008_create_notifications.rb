class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :member
      t.integer :actor
      t.string :object
      t.integer :object_id
      t.boolean :seen
      t.timestamps
    end
  end
end
