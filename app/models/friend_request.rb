class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # Builds friendship and deletes friend request
  def accept_friend
    user.friends << friend
    friend.friends << user
    destroy
  end
end
