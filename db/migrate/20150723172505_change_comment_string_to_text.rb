class ChangeCommentStringToText < ActiveRecord::Migration
  def change
      change_column :comments, :text, :text
  end
end
