module VotableController
  extend ActiveSupport::Concern

  def upvote
    vote(1)
  end
 

  def downvote
    vote(-1) 
  end

  private

  def vote(val)
    @object = find_object
    if vote_exists?
      update_vote(val)
    else
      @object.votes.create(:score => val, :user => current_user)
    end
    @object.update_score
    redirect_to :back
  end


  def find_object
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def vote_exists?
    @object.votes.find_by_user_id(current_user.id)
  end

  def update_vote(score)
    @object.votes.find_by_user_id(current_user.id).update_attributes(:score => score)
  end

end
