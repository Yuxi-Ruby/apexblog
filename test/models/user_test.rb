require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobarfo", password_confirmation: "foobarfo")
  end

  test "should be valid" do
    @user.valid?
    puts "@user.errors #{@user.errors.to_json}"
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

	#test "exist user model" do
		#User_model_exist = users
		#assert_not_nil User_model_exist, "User model not exists"
	#end

	#test "exist user two" do
		#User_two_exist = users(:two)
		#assert User_two_exist, "Two user not exist"
	#end

	#test "name_field_presence" do
		#user_name = users(:one).name
		#assert_not_nil user_name, "Name field not presence"
	#end

	#test "email_field_presence" do
		#user_email = users(:one).email
		#assert_not_nil user_email, "Email field not presence"
	#end

	#test "email_field_format_valid" do
		#user_email = users(:one).email
		#assert_match /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, user_email, "Email field not format_valid"
	#end

	#test "email_unique" do
		#user_new = User.new(:name => 'Andrea', :email => 'stevssen@hotmail.com')
		#assert user_new.valid?, "¡Email field exist!"
	#end
end
