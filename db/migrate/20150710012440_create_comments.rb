class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :parent_comment
      t.references :post
      t.string :text
      t.timestamps
    end
  end
end
