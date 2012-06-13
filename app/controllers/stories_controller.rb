class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])
    if @story.save
      redirect_to :action => "index" 
    else
      redirect_to :action => "new", :notice => "Invalid Submission"
    end
  end
             
  def index 
    @stories = Story.all
  end

end
