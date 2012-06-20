class Comment < ActiveRecord::Base

  attr_accessible :body

  belongs_to :story
  belongs_to :user

  validates :user, :presence => true
  validates :body, :presence => true

  
  def pretty_time
    diff_seconds = Time.now - self.created_at
    case diff_seconds
      when 0 .. 59
        "#{(diff_seconds).to_i} seconds ago"
      when 60 .. (3600-1)
        "#{(diff_seconds/60).to_i} minutes ago"
      when 3600 .. (3600*24-1)
        "#{(diff_seconds/3600).to_i} hours ago"
      when (3600*24) .. (3600*24*30) 
        "#{(diff_seconds/(3600*24)).to_i} days ago"
      else
        self.create_at.strftime("%m/%d/%Y")
    end
  end

end
