require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @post = posts(:the_force)
    @user = users(:anakin)
  end

  test 'creation when not signed-in' do
    assert_no_difference 'Like.count' do
      post likes_path, params: { like: { user: @user.id, post: @post.id } }
    end
  end

end
