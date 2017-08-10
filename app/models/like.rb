class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true, uniqueness: { scope: :user }

  validate :not_own_post

  private

  def not_own_post
    errors.add(:post, 'cannot like own post') if user.posts.include?(post)
  end
end
