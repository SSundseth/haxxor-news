class CommentsController < ApplicationController

  before_filter :find_comment_by_comment_id, :only => [:upvote, :downvote]

  def new
    @comment = Comment.new
  end


  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to story_path(@comment.story)
    else
      flash[:error] = "Comment cannot be blank"
      redirect_to :back
    end
  end


  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.comments
    @commentable = @comment
  end


  def upvote
    if vote_exists?
      update_vote(1)
    else
      @comment.votes.create(:score => 1, :user => current_user)
    end
    @comment.update_score
    redirect_to :back
  end
 

  def downvote
    if vote_exists?
      update_vote(-1)
    else
      @comment.votes.create(:score => -1, :user => current_user)
    end
    @comment.update_score
    redirect_to :back
  end



  private

  def vote_exists?
    @comment.votes.find_by_user_id(current_user.id)
  end

  def update_vote(score)
      Vote.find(:first, :conditions => { :user_id => current_user.id, :votable_type => "Comment", :votable_id => @comment.id }).update_attributes(:score => score)
  end


  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def find_comment_by_comment_id
    @comment = Comment.find(params[:comment_id])
  end

end
