module ApplicationHelper

  def store_return_to
    session[:return_to] = request.url
  end
end
