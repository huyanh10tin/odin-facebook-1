class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_to user_path(post.user)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unlike(post)
    redirect_to user_path(post.user)
  end
end
