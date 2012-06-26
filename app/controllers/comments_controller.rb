
class CommentsController < ApplicationController
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
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comments = @comment.comments
    @commentable = @comment
  end


  def upvote
    @comment = Comment.find(params[:comment_id])

    if Vote.exists?(:user_id => current_user.id, :votable_type => "Comment", :votable_id => @comment.id)
      Vote.find(:first, :conditions => { :user_id => current_user.id, :votable_type => "Comment", :votable_id => @comment.id }).update_attributes(:score => 1)

    else
      @comment.votes.create(:score => 1, :user => current_user)
    end

    redirect_to :back
  end
 

  def downvote
    @comment = Comment.find(params[:comment_id])

    if Vote.exists?(:user_id => current_user.id, :votable_type => "Comment", :votable_id => @comment.id)
      Vote.find(:first, :conditions => { :user_id => current_user.id, :votable_type => "Comment", :votable_id => @comment.id }).update_attributes(:score => -1)

    else
      @comment.votes.create(:score => -1, :user => current_user)
    end

    redirect_to :back
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
