class Comment < ActiveRecord::Base
  #acts_as_tree :order => "created_at"

  attr_accessible :body

  belongs_to :story
  belongs_to :user

  validates :story_id, :presence => true
  validates :user_id, :presence => true
  validates :body, :presence => true

end
