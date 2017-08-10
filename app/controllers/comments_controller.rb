class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to user_path(@comment.post.user)
    else
      flash[:danger] = 'Could not comment on post.'
      redirect_to user_path(@comment.post.user)
    end
  end

  def update
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    redirect_to user_path(comment.post.user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
