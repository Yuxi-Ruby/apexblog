# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
	validates :title, presence: true,uniqueness: true, length:{ maximum: 20, minimum: 7 }

   has_and_belongs_to_many :articles

	def convert_capitalize(string)
	 	string.to_s.capitalize
	end
end
