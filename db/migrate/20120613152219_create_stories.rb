class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
  end
end
