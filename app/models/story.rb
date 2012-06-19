class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates_presence_of :title, :url
  validates :url, :format => { :with => /^(http:|https:)\/\/*/, :message => "must begin with http:// or https://" }
 
  scope :chrono, :order => "created_at DESC"

  belongs_to :user

  def pretty_time
    diff_seconds = Time.now - self.created_at
    case diff_seconds
      when 0 .. 59
        "#{(diff_seconds).to_i} seconds ago"
      when 60 .. (3600-1)
        "#{(diff_seconds/60).to_i} minutes ago"
      when 3600 .. (3600*24-1)
        "#{(diff_seconds/360).to_i} hours ago"
      when (3600*24) .. (3600*24*30) 
        "#{(diff_seconds/(3600*24)).to_i} days ago"
      else
        start_time.strftime("%m/%d/%Y")
    end
  end
end
