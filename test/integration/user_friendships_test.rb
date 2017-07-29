require 'test_helper'

class UserFriendshipsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @anakin = users(:anakin)
    @luke = users(:luke)
  end

  test 'send friend request' do
    sign_in @anakin
    assert_difference 'FriendRequest.count' do
      post friend_requests_path, params: { friend_id: @luke.id }
    end
    assert_redirected_to user_path(@luke)
    follow_redirect!
    assert_not flash.empty?
    assert @anakin.pending_friends.include?(@luke)
  end
end
