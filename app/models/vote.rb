class Vote < ActiveRecord::Base
  
  attr_accessible :score, :user, :votable_id, :votable_type

  validates :user, :presence => true
  validates :votable, :presence => true
  validates :score, :presence => true, :inclusion => { :in => [1,-1] }

  belongs_to :user
  belongs_to :votable, :polymorphic => true

  scope :upvotes, where(:score => 1)
  scope :downvotes, where(:score => -1)

end
