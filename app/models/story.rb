class Story < ActiveRecord::Base
  attr_accessible :url, :title

  validates_presence_of :title, :url, :user_id
  validates :url, :format => { :with => /^(http:|https:)\/\/*/, :message => "must begin with http:// or https://" }
 
  scope :chrono, :order => "created_at DESC"

  belongs_to :user
  has_many :comments



end
