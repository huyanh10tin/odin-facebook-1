class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = User.find(params[:id])
    current_user.remove_friend(@friend)
    flash[:info] = 'Friend removed.'
    redirect_to user_friends_path(current_user)
  end
end
