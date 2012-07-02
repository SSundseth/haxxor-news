class User < ActiveRecord::Base
  include Clearance::User

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :stories
  has_many :comments
  
  def karma
    story_karma = self.stories.each.sum { |story| story.score }
    comment_karma = self.comments.each.sum { |comment| comment.score }
    story_karma + comment_karma
  end
end
