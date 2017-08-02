require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers

  def setup
    @anakin = users(:anakin)
    sign_in @anakin
  end

  test 'profile page' do
    get user_path(@anakin)
    assert_template 'users/show'
    assert_select 'title', "#{@anakin.name}'s Profile | Longhouse"
    assert_select 'h4', text: @anakin.name
    assert_select 'img'
    assert_match @anakin.posts.count.to_s, response.body
  end
end
