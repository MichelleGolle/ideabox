class CreateIdeaCategories < ActiveRecord::Migration
  def change
    create_table :idea_categories do |t|
      t.integer :idea_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
