class CommentsController < ApplicationController
  include VotableController

  def create
    @commentable = find_object
    @comment = @commentable.comments.build(params[:comment].merge(:user_id => current_user.id))

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
end
