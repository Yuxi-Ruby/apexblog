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

class Article < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 50, minimum: 5}
  validates :body, presence: true, if: "description.nil?"
  validates :description, presence: true, if: "body.nil?"

  validates :body, length: {minimum: 5}, if: "!body.nil?"
  validates :description, length: {maximum: 200, minimum: 5}, if: "!description.nil?"

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :categories

  search_fields [:title, :description, :body]
end
