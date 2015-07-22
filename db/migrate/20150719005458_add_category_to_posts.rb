class AddCategoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category, :string, :default => nil
  end
end
