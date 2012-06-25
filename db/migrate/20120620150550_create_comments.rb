class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :user_id
      t.references :commentable, :polymorphic => true
      t.integer :score
      t.timestamps
    end
  end
end
