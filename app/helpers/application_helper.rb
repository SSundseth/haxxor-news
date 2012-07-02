module ApplicationHelper

  def update_score
    score = self.votes.upvotes.count - self.votes.downvotes.count
    self.update_attributes(:score => score)
  end

  def store_return_to
    session[:return_to] = request.url
  end

  def redirect_back_or_default
    redirect_to(session[:return_to] || '/')
    session[:return_to] = nil
  end
end
