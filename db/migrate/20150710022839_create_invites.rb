class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :member
      t.belongs_to :member_received
      t.string :code
      t.timestamps null: false
    end
  end
end
