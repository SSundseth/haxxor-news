
class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to story_path(@story)
    else
      flash[:error] = 'Comment not saved'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
