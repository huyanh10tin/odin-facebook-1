class User < ApplicationRecord
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Password validations handled by devise gem
  # Email presence, format, uniqueness handled by devise gem
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }

  def num_of_friend_requests
    FriendRequest.where(friend: self).count
  end

  def remove_friend(friend)
    friends.destroy(friend)
  end
end
