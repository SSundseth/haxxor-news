class Story < ActiveRecord::Base
  attr_accessible :url, :title, :score

  validates_presence_of :title, :url, :user_id
  validates :url, 
            :format => { :with => /^(http:|https:)\/\/*/, 
            :message => "must begin with http:// or https://" }

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable, :dependent => :destroy

  scope :order_choice, lambda { |story_order|
    case story_order
      when "most_points_daily"
        where("created_at >= ?", 1.day.ago).order("score DESC")
      when "most_points_weekly"
        where("created_at >= ?", 1.week.ago).order("score DESC")
      when "most_points_monthly"
        where("created_at >= ?", 1.month.ago).order("score DESC")
      when "newest"
        order("created_at DESC")
      else
        order("score DESC")
    end
  }
  
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
