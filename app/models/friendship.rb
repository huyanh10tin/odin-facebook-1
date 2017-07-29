class Friendship < ApplicationRecord
  # after_create :create_inverse_friendship
  after_destroy :delete_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def create_inverse_friendship
    friend.friendships.create(friend: user)
  end

  def delete_inverse_friendships
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
