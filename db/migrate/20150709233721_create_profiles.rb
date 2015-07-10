class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :member
      t.integer :reputation
      t.timestamps
    end
  end
end
