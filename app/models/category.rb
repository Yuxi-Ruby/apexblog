class Category < ActiveRecord::Base
	validates :title, presence: true,uniqueness: true, length:{ maximum: 20, minimum: 7 }
	def convert_capitalize(string)
	 	string.to_s.capitalize
	end
end