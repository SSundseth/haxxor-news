class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :commentable
  belongs_to :user

  validates :story_id, :presence => true
  validates :user_id, :presence => true
  validates :body, :presence => true

end
