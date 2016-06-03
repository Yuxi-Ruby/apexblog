class Comment < ActiveRecord::Base
   validates :description, presence: true, length: { minimum: 2 }
   validates :user, presence: true
   validates :article, presence: true
   # validates_associated :article
   # validates_associated :user

   belongs_to :article
   belongs_to :user
end
