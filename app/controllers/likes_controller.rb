class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: post)

    flash[:danger] = 'Could not like post.' if !@like.save
    redirect_to user_path(post.user)
  end

  def destroy

  end
end
