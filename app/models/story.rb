class Story < ActiveRecord::Base
  attr_accessible :url, :title, :score

  validates_presence_of :title, :url, :user_id
  validates :url, 
            :format => { :with => /^(http:|https:)\/\/*/, 
            :message => "must begin with http:// or https://" }

  belongs_to :user
  has_many :comments, :as => :commentable

  scope :chrono, :order => "created_at DESC"

  def initialize
    @score = 0
  end

  def comment_count
    count = comments.length
    comments.each do |c|
      count += c.comment_count
    end
    count
  end

  def upvote
    score += 1
  end

  def downvote
    score -= 1
  end
end
