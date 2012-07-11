class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  def render_404
    render :text => 'Not Found', :status => :not_found
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
end
