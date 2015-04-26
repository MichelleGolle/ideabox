class RemoveCategoryIdFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :category_id
  end
end
