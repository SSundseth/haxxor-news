class User < ActiveRecord::Base
  include Clearance::User

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :stories
  has_many :comments
end
