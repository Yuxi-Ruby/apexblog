# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @valid_article = articles(:valid)
  end

  test "title is present" do
    art = articles(:no_title)
    art.valid?
    assert_match "can't be blank", art.errors[:title].join, "Title presence should be validated"
  end

  test "verification of maximum title length is 50" do
    @valid_article.title = "Title" * 11
    @valid_article.valid?
    assert_match "is too long", @valid_article.errors[:title].join, "Maximun length should be validated"
  end

  test "minimum title length is 5" do
    @valid_article.title = "Titl"
    @valid_article.valid?
    assert_match "is too short", @valid_article.errors[:title].join, "Minimum length should be validated"
  end

  test "at least one of body or description are present" do
    @valid_article.description = nil
    @valid_article.body = nil
    @valid_article.valid?
    assert_match "can't be blank", @valid_article.errors[:description].join << @valid_article.errors[:body].join, "Should validate body and description should be presence."
  end

  test "article is valid with body and no description" do
    @valid_article.body = "Morbi et sodales dolor. Pellentesque vulputate est at nibh fringilla venenatis."
    @valid_article.description = nil
    @valid_article.valid?
    assert_empty @valid_article.errors[:description], "Should validate description ONLY IF there is no body!"
  end

  test "article is valid with description and no body" do
    @valid_article.body = nil
    @valid_article.description = "Morbi et sodales dolor. Pellentesque vulputate est at nibh fringilla venenatis."
    @valid_article.valid?
    assert_empty @valid_article.errors[:body], "Should validate body ONLY IF there is no description!"
  end

  test "maximum description length is 200" do
    @valid_article.description = "Description" * 20
    puts "description length: #{@valid_article.description.length}"
    @valid_article.valid?
    assert_match "is too long", @valid_article.errors[:description].join, "Maximun length of :description should be validated to 200"
  end

  test "minimum description length is 5" do
    @valid_article.description = "Desc"
    puts "description length: #{@valid_article.description.length}"
    @valid_article.valid?
    assert_match "is too short", @valid_article.errors[:description].join, "Minimum length of :description should be validated to 5"
  end

  test "minimum body length is 5" do
    @valid_article.body = "Body"
    puts "body length: #{@valid_article.body.length}"
    @valid_article.valid?
    assert_match "is too short", @valid_article.errors[:body].join, "Minimum length of :body should be validated to 5"
  end

  test "articles respond to comments" do
    skip "UnFinished test"
  end

  test "articles respond to categories" do
    skip "UnFinished test"
  end

  test "articles belongs to user" do
    skip "UnFinished test"
  end
end
