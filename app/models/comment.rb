class Comment < ActiveRecord::Base
   validates :description, presence: true, length: { minimum: 2 }
   validates :user, presence: true
   validates :article, presence: true

   belongs_to :article
   belongs_to :user
end
