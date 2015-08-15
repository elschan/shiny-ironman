class ChangeStringToTextCoffeemeets < ActiveRecord::Migration
  def change
    change_column :coffeemeets, :invite_blurb, :text
    change_column :coffeemeets, :invite_accept, :text
  end
end
