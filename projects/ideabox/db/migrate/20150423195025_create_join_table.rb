class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ideas, :images do |t|
      t.index :idea_id
      t.index :image_id
    end
  end
end
