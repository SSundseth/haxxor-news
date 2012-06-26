
class VotesController < ApplicationController
  
  def upvote
    if Vote.exists?(params[:id])?
      Vote.find(params[:id]).update_attribute(:score, 1)
    else
      @votable = find_votable
      @vote = @votable.votes.build(params[:vote])
      @vote.score = 1
      @vote.save
    end
  end

  def downvote
    if Vote.exists?(params[:id])?
      Vote.find(params[:id]).update_attribute(:score, -1)
    else
      @votable = find_votable
      @vote = @votable.votes.build(params[:vote])
      @vote.score = -1
      @vote.save
    end
  end  


