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
    @stories = Story.chrono.paginate(:page => params[:page])
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

    redirect_to :back
  end
 

  def downvote
    if vote_exists?  
      update_vote(-1)
    else
      @story.votes.create(:score => -1, :user => current_user)
    end

    redirect_to :back
  end



  private
    def find_by_story_id
      @story = Story.find(params[:story_id])
    end

    def vote_exists?
      Vote.exists?(:user_id => current_user.id, :votable_type => "Story", :votable_id => @story.id)
    end

    def update_vote(score)
      Vote.find(:first, :conditions => { :user_id => current_user.id, :votable_type => "Story", :votable_id => @story.id }).update_attributes(:score => score)
    end
end
