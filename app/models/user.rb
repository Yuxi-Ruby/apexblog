class User < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 1, maximum: 10}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
