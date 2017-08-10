class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @posts = current_user.posts
      @friends = current_user.friends
      @post = Post.new(user: @user)
    end
  end

  def about
  end

  def contact
  end
end
