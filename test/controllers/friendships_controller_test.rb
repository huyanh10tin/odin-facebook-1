require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    user = users(:anakin)
    sign_in user
    get user_friends_path(user)
    assert_response :success
  end

  test "should get destroy" do
    get friendships_destroy_url
    assert_response :success
  end

end
