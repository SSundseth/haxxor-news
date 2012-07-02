class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.integer :user_id, :null => false
      t.integer :score, :default => 0
      t.timestamps
    end

    add_index :stories, :user_id
  end
end
