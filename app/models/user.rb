class User < ActiveRecord::Base
  include Clearance::User

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :stories, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  def karma
    story_karma = self.stories.each.sum { |story| story.score }
    comment_karma = self.comments.each.sum { |comment| comment.score }
    story_karma + comment_karma
  end

  def has_voted?(votable, score)
    Vote.exists?({:user_id => self.id, :votable_type => votable.class.name, :votable_id => votable.id, :score => score})
  end
end
