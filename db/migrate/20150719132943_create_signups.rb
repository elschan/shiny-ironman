class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.string :application
      t.boolean :accepted, :default => false
      t.timestamps
    end
  end
end
