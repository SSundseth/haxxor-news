class StoriesController < ApplicationController
  include VotableController

  before_filter :store_return_to

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
    @stories = Story.since(params[:date]).order(set_order).paginate(:page => params[:page])
  end

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
    @commentable = @story
  end


  private

    def set_order
      if %w(score created_at).include?(params[:order])
        "#{params[:order]} DESC"
      else
        'score DESC'
      end
    end

    def store_return_to
      session[:return_to] = request.url
    end
end
