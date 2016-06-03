require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment_empty = comments(:not_presence)
    @comment_long_desc = comments(:not_long_desc)
    @comment_valid = comments(:valid)
  end

  test "Invalid description gives error message" do
    assert_presence(@comment_empty , :description)
  end

  test "Invalid author gives error message" do
    assert_presence(@comment_empty , :user)
  end

  test "Invalid article gives error message" do
    assert_presence(@comment_empty , :article)
  end

  test "belongs_to user model" do
    assert_respond_to @comment_valid, :user
  end

  test "belongs_to article model" do
    assert_respond_to @comment_valid, :article
  end

  test "Invalid minimum long description gives error message" do
   @comment_long_desc.valid?
    assert_match "is too short (minimum is 2 characters)" , @comment_long_desc.errors[:description].join, "Minimum long error for description  is not found on comment.class"
  end

  test "contains an user" do
    assert_respond_to users(:esteban), @comment_valid.user, "Comment doesn't contain an author"
  end

  test "contains an article" do
    assert  articles(:valid) ==  @comment_valid.article
  end
end
