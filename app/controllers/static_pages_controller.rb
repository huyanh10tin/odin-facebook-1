class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @feed = @user.feed
      @posts = current_user.posts
      @favorites = current_user.liked_posts
      @friends = current_user.friends
      @post = Post.new(user: @user)
    end
  end

  def about
  end

  def contact
  end
end
