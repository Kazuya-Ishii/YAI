class User < ApplicationRecord  
  validates :name, presence: true, length: {maximum:15 }
  validates :email, presence:true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true

  has_secure_password

  has_many :topics
end
