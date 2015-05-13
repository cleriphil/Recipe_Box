class RenameCategoryColumn < ActiveRecord::Migration
  def change
    rename_column(:recipes, :catagory_id, :category_id)
  end
end
