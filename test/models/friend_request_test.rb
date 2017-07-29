require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @request = FriendRequest.new(user_id: users(:anakin).id,
                                 friend_id: users(:luke).id)
  end

  test 'should be valid' do
    assert @request.valid?
  end

  test 'user id should be present' do
    @request.user_id = nil
    assert_not @request.valid?
  end

  test 'friend id should be present' do
    @request.friend_id = nil
    assert_not @request.valid?
  end
end
