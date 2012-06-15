class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates :title, :presence => true
  validates :url, :presence => true
  validates :url, :format => { :with => /http:\/\/*/ }


  scope :reverse_all, :order => "id DESC"
end
