require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "should not save category without title" do
    cat1 = Category.new({:title => "Title new"})
    cat1.title = nil
    assert !cat1.save, "Should not save without title"
  end
  test 'should have unique title' do
    cat1 = Category.create(:title => "Title new1")
    cat2 = Category.create(:title => "Title new1")
    cat2.valid?
    assert_match "has already been taken", cat2.errors[:title].join, "include unique validations for title"
  end
  test "verify title presence" do 
    cat = Category.new({:title => nil}) 
    assert !cat.valid?, "should verify that title is  present #{cat.errors.inspect}"
  end
  test 'the title should be invalid if title exceeds Max length' do
    cat = Category.new(:title => "Article title ")
    cat.title = "the title should be bigger to 20 characters"
    cat.valid?
    assert_match "is too long (maximum is 20 characters)", cat.errors[:title].join, "The model should have validations for Max length"
  end
  test "the title should not be valid if the title not exceeds the minimum length" do
    cat = Category.new(:title => "Article title")
    cat.title = "Title "
    cat.valid?
    assert_match "is too short (minimum is 7 characters)", cat.errors[:title].join, "The model should have validations for Min length"
  end
  test "The category  respond to convert_capitalize" do
    assert_respond_to categories(:complete),:convert_capitalize, "create method convert_capitalize"
  end
  test "convert_capitalize shouldn't return nil" do
    cat = Category.new({:title => "title for the article"})
    assert_not_nil cat.convert_capitalize(cat.title)
  end
  test "convert_capitalize should return capitalize string" do 
    cat = Category.new({:title => "Title for the article"})
    assert_equal   cat.title, cat.convert_capitalize(cat.title)
  end 
end
