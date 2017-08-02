require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:anakin)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'valid email formats should be accepted' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn] # From Hartl tut
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid."
    end
  end

  test 'invalid email formats should be rejected' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com] # Fomr Hartl tut
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid."
    end
  end

  test 'emails should be unique' do
    dup_user = @user.dup
    dup_user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test 'emails should be saved in lowercase' do
    @user.email = 'UseR@eXamPle.COM'
    lc_email = 'user@example.com'
    @user.save
    assert_equal @user.reload.email, lc_email
  end

  test 'passwords should not be blank' do
    @user.password = @user.password_confirmation = ' ' * 7
    assert_not @user.valid?
  end

  test 'passwords must be at least 6 character long' do
    @user.password = @user.password_confirmation = 'a'
    assert_not @user.valid?
  end

  test "user's posts should be destroyed on user destruction" do
    @user.posts.create!(content: 'Lorem ipsum')
    assert_difference 'Post.count', -3 do
      @user.destroy
    end
  end
end
