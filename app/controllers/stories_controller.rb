class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    if @story.save
      redirect_to stories_url
    else
      redirect_to new_story_url
    end
  end
             
  def index 
    @stories = Story.all
  end

end
