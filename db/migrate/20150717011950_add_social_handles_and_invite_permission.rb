class AddSocialHandlesAndInvitePermission < ActiveRecord::Migration
  def change
    add_column :members, :open_to_irl, :boolean, :default => false
    add_column :members, :social_handles, :string
  end
end
