class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @post = current_user.posts.build if user_signed_in?
  end

  def about
  end

  def contact
  end
end
