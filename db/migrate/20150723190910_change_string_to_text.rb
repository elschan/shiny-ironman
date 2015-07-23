class ChangeStringToText < ActiveRecord::Migration
  def change
      change_column :signups, :application, :text
  end
end
