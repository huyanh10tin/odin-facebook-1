class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = User.find(params[:friend_id])
    current_user.remove_friend(@friend)
  end
end
