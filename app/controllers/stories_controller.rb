class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @user = User.find(current_user.id)
    @story = @user.stories.build(params[:story])

    if @story.save
      redirect_to stories_url
    else
      render :new
    end
  end
             
  def index 
    @stories = Story.chrono.paginate(:page => params[:page])
  end

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
    @commentable = @story
  end

end
