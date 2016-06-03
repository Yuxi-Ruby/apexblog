# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  body        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Article < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 40, minimum: 5}
	validates :body, presence: true, if: "description.nil?"
	validates :description, presence: true, if: "body.nil?"

	validates :body, length: {maximum: 1500, minimum: 5}, if: "!body.nil?"
	validates :description, length: {maximum: 150, minimum: 5}, if: "!description.nil?"
end
