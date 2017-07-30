require 'test_helper'

class UserFriendshipsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @anakin = users(:anakin)
    @leia = users(:leia)
    @luke = users(:luke)
    sign_in @anakin
  end

  test 'send friend request' do
    assert_difference '@anakin.pending_friends.count' do
      post friend_requests_path, params: { friend_id: @leia.id }
    end
    assert_redirected_to user_path(@leia)
    follow_redirect!
    assert_not flash.empty?
    assert @anakin.pending_friends.include?(@leia)
  end

  test 'accept friend request' do
    assert_difference '@anakin.friends.count' do
      patch friend_request_path(friend_requests(:one))
    end
  end

  test 'decline friend request' do
    assert_difference '@anakin.pending_friends.count', -1 do
      delete friend_request_path(friend_requests(:one))
    end
  end

  test 'delete friend' do
    assert_difference '@anakin.friends.count', -1 do
      delete friendship_path(friendships(:one))
    end
  end
end
