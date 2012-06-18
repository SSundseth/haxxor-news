class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates_presence_of :title, :url
  validates :url, :format => { :with => /http:\/\/*/ }

  scope :reverse_all, :order => "id DESC"
end
