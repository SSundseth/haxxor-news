class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, :null => false
      t.integer :score, :null => false
      t.references :votable, :polymorphic => true

      t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, :votable_id
  end
end
