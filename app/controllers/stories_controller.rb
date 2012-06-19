class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    @story.user_id = clearance_session.current_user
    if @story.save
      redirect_to stories_url
    else
      render :new
    end
  end
             
  def index 
    @stories = Story.chrono.paginate(:page => params[:page])
  end

end
