require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobarfo", password_confirmation: "foobarfo")
  end

  def valid_mail email
    if email =~ /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
	  	return false
    end
    return true
  end

  test "should be valid" do
    @user.valid?
  end

  test "password should be not present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "password should have a maximum length" do
    @user.password = @user.password_confirmation = "a" * 73
    @user.valid?
    assert_match "is too long (maximum is 72 characters)", @user.errors[:password].join, "password field should have max 72 characters"
  end

  test "name should not be present" do
    @user.name = nil
    assert_not @user.valid?, "should be name presence"
  end

	test "name should be too long" do
    @user.name = "2" * 222
    @user.valid?
  	assert_match "is too long (maximum is 10 characters)", @user.errors[:name].join, "name should be too long"
  end

  test "name should be not too long" do
    @user.name = "1" * 2
    @user.valid?
  	assert_match "is too short (minimum is 3 characters)", @user.errors[:name].join, "name should be not too long"
  end

  test "email should be not unique" do
  	duplicate_user = @user.dup
  	@user.save
    assert_not duplicate_user.valid?
  end

	test "email field should be not presence" do
		@user.email = ""
		@user.valid?
		assert_match "can't be blank", @user.errors[:email].join, "email field should be not presence"
	end

	test "email field should be not format totally correct" do
		@user.email = "no_valido@.s"
		result = valid_mail @user.email
		assert result, "email field should be not format totally correct"
	end
end
