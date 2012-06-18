class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates_presence_of :title, :url
  validates :url, :format => { :with => /http:\/\/*/ }

  scope :chrono, :order => "created_at DESC"
end
