module Votable
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    has_many :comments, :as => :commentable
    has_many :votes, :as => :votable
    
    validates :user_id, :presence => true
  end
  
  def comment_count
    count = comments.length
    comments.each do |c|
      count += c.comment_count
    end
    count
  end

  def update_score
    score = votes.upvotes.count - votes.downvotes.count
    update_attributes(:score => score)
  end
end

