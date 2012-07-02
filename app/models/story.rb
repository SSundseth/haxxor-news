class Story < ActiveRecord::Base
  attr_accessible :url, :title, :score

  validates_presence_of :title, :url, :user_id
  validates :url, 
            :format => { :with => /^(http:|https:)\/\/*/, 
            :message => "must begin with http:// or https://" }

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable, :dependent => :destroy

  scope :since, lambda { |date| where("created_at >= ?", date) if date.present? }
  
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

  def shorten_url
    url.sub(/(http|https):\/\//, "")
  end
end
