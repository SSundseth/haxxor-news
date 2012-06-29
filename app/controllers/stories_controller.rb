class StoriesController < ApplicationController

  before_filter :find_by_story_id, :only => [:upvote, :downvote]

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

  def upvote
    if vote_exists?
      update_vote(1)
    else
      @story.votes.create(:score => 1, :user => current_user)
    end
    @story.update_score
    redirect_to :back
  end
 

  def downvote
    if vote_exists?  
      update_vote(-1)
    else
      @story.votes.create(:score => -1, :user => current_user)
    end
    @story.update_score
    redirect_to :back
  end



  private
    def find_by_story_id
      @story = Story.find(params[:story_id])
    end

    def vote_exists?
      @story.votes.find_by_user_id(current_user.id)
    end

    def update_vote(score)
      @story.votes.find_by_user_id(current_user.id).update_attributes(:score => score)
    end

    def set_order
      if %w(score created_at).include?(params[:order])
        "#{params[:order]} DESC"
      else
        'score DESC'
      end
    end
end
