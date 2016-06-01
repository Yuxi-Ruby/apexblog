require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "exist user model" do
		User_model_exist = users
		assert_not_nil User_model_exist, "User model not exists"
	end

	test "exist user two" do
		User_two_exist = users(:two)
		assert User_two_exist, "Two user not exist"
	end

	test "name_field_presence" do
		user_name = users(:one).name
		assert_not_nil user_name, "Name field not presence"
	end

	test "email_field_presence" do
		user_email = users(:one).email
		assert_not_nil user_email, "Email field not presence"
	end

	test "email_field_format_valid" do
		user_email = users(:one).email
		assert_match /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, user_email, "Email field not format_valid"
	end

	test "email_unique" do
		user_new = User.new(:name => 'Andrea', :email => 'stevssen@hotmail.com')
		assert user_new.valid?, "¡Email field exist!"
	end
end
