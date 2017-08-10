class CommentsController < ApplicationController
  before_action :correct_user,  only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    flash[:danger] = 'Could not comment on post.' unless @comment.save
    redirect_to request.referrer
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(content: params[:comment][:content])
    redirect_to request.referrer
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
end
