class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.integer :invite_count
      t.integer :reputation
      t.timestamps
    end
  end
end
