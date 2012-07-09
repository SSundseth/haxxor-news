class Story < ActiveRecord::Base
  include Votable

  attr_accessible :url, :title, :score

  validates_presence_of :title, :url
  validates :url, 
            :format => { :with => /^(http:|https:)\/\/*/, 
            :message => "must begin with http:// or https://" }

  scope :since, lambda { |date| where("created_at >= ?", date) if date.present? }
  
  def shorten_url
    url.sub(/(http|https):\/\//, "")
  end
end
