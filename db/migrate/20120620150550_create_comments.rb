class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :user_id, :null => false
      t.integer :score, :default => 0
      t.references :commentable, :polymorphic => true
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :commentable_id
  end
end
