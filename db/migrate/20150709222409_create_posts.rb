class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :member
      t.string :title
      t.string :url
      t.string :text
      t.integer :upvote_count, :default => 1
      t.string :comments
      t.timestamps
    end
  end
end
