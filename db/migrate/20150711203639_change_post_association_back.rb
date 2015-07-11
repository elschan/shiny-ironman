class ChangePostAssociationBack < ActiveRecord::Migration
  def change
    rename_column :posts, :profile_id, :member_id
  end
end
