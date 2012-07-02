class Comment < ActiveRecord::Base
  attr_accessible :body, :score, :commentable_id, :commentable_type

  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable, :dependent => :destroy

  validates :user_id, :presence => true
  validates :body, :presence => true
  validates :commentable, :presence => true

  scope :chrono, :order => "created_at DESC"

  def story
    if commentable.is_a? Story
      commentable
    else
      commentable.story
    end
  end

  def comment_count
    count = comments.length
    comments.each do |c|
      count += c.comment_count
    end
    count
  end

  def update_score
    score = self.votes.upvotes.count - self.votes.downvotes.count
    self.update_attributes(:score => score)
  end
end
