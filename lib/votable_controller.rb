module VotableController
  extend ActiveSupport::Concern


  def upvote
    if vote_exists?
      update_vote(1)
    else
      self.votes.create(:score => 1, :user => current_user)
    end
    self.update_score
    redirect_to :back
  end
 

  def downvote
    if vote_exists?  
      update_vote(-1)
    else
      self.votes.create(:score => -1, :user => current_user)
    end
    self.update_score
    redirect_to :back
  end


    def vote_exists?
      self.votes.find_by_user_id(current_user.id)
    end

    def update_vote(score)
      self.votes.find_by_user_id(current_user.id).update_attributes(:score => score)
    end

end
