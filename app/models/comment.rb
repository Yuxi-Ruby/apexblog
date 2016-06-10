# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  article_id  :integer
#  user_id     :integer
#

class Comment < ActiveRecord::Base
   validates :description, presence: true, length: { minimum: 2 }
   validates :user, presence: true
   validates :article, presence: true

   belongs_to :article
   belongs_to :user
end
