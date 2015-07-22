class AddContactInfoToCoffeemeet < ActiveRecord::Migration
  def change
      add_column :coffeemeets, :invite_blurb_contact, :string
      add_column :coffeemeets, :invite_accept_contact, :string
  end
end
