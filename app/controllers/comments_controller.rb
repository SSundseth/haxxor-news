class CommentsController < ApplicationController
  include VotableController

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
