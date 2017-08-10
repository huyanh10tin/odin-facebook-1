class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @posts = current_user.posts
      @friends = current_user.friends
      @post = @user.posts.build
    end
  end

  def about
  end

  def contact
  end
end
