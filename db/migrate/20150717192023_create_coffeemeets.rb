class CreateCoffeemeets < ActiveRecord::Migration
  def change
    create_table :coffeemeets do |t|
      t.string :location
      t.boolean :accepted
      t.boolean :confirmed
      t.string :invite_blurb
      t.string :invite_accept
      t.integer :inviter_id
      t.integer :invitee_id
      t.timestamps
    end
  end
end
