class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates_presence_of :title, :url
  validates :url, :format => { :with => /^(http:|https:)\/\/*/, :message => "must begin with http:// or https://" }
 
  scope :chrono, :order => "created_at DESC"
end
