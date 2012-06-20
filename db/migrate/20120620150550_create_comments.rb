class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :story_id
      t.integer :parent_comment_id, :class => 'comment'

      t.timestamps
    end
  end
end
