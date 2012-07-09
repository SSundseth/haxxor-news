class Comment < ActiveRecord::Base
  include Votable

  attr_accessible :body, :score, :commentable_id, :commentable_type

  belongs_to :commentable, :polymorphic => true

  validates :body, :presence => true
  validates :commentable, :presence => true

  scope :chrono, :order => "created_at DESC"

  def story
    if commentable.is_a? Story
      commentable
    else
      commentable.story
    end
  end
end
