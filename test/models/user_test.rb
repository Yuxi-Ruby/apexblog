require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobarfo", password_confirmation: "foobarfo")
  end

  test "should be valid" do
    @user.valid?
    # puts "@user.errors #{@user.errors.to_json}"
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "password" do
    @user.password = @user.password_confirmation = "a" * 73
    @user.valid?
    assert_match "is too long (maximum is 72 characters)", @user.errors[:password].join, "password field should have max 72 characters"
  end

  test "name should be present" do
    @user.name = nil
    assert_not @user.valid?, "should be name presence"
  end

  test "email should be unique" do
  	user = User.create(:name => "Steven", :email => "steven@hotmail.com")
  	user.valid?
    assert_match "has already been taken", user.errors[:email].join, "has already been taken this email"
  end
# yet not function
 #  test "name field length" do
	# 	user = users(:one)
 #  	user.valid?
 #    puts "user.errors[:name].join -> #{user.errors[:name].join}"
 #  	assert_match "is too short (minimum is 3 characters)", user.errors[:name].join, "Name field should have min 3 characters"
	# end




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
