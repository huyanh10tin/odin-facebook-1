class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @feed = @user.feed.paginate(page: params[:feed_page], per_page: 15)
      @posts = current_user.posts.paginate(page: params[:posts_page], per_page: 15)
      @favorites = current_user.liked_posts.paginate(page: params[:favorites_page], per_page: 15)
      @friends = current_user.friends.paginate(page: params[:friends_page], per_page: 15)
      @post = Post.new(user: @user)
    end
  end

  def about
  end

  def contact
  end
end
