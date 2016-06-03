# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#

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
    assert @user.valid?, "@user should be valid"
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?, "password should be blank"
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?, "password should have a minimum length"
  end

  test "password should have a maximum length" do
    @user.password = @user.password_confirmation = "a" * 73
    @user.valid?
    assert_match "is too long (maximum is 72 characters)", @user.errors[:password].join, "password field should have max 72 characters"
  end

  test "name should be not present" do
    @user.name = nil
    assert_not @user.valid?, "should be not name presence"
  end

	test "name should be too long" do
    @user.name = "2" * 101
    @user.valid?
  	assert_match "is too long (maximum is 100 characters)", @user.errors[:name].join, "name should be too long"
  end

  test "name should be not too long" do
    @user.name = "1" * 2
    @user.valid?
  	assert_match "is too short (minimum is 3 characters)", @user.errors[:name].join, "name should be not too long"
  end

  test "email should be unique" do
  	duplicate_user = @user.dup
  	@user.save
    assert_not duplicate_user.valid?, "email should be not unique"
  end

	test "email field should be presence" do
		@user.email = ""
		@user.valid?
		assert_match "can't be blank", @user.errors[:email].join, "email field should be not presence"
	end

	test "email field should be format valid" do
		@user.email = "no_valido@.s"
		result = valid_mail @user.email
		assert result, "email field should be not format totally correct"
	end

end
