class AddColumnCommentCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comment_count, :integer, :default => 0
  end
end
