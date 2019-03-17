class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:15 }
  validates :email, presence:true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


  has_secure_password
  validates :password, presence: true, allow_nil:true

  has_many :topics

  mount_uploader :image, ImageUploader
end
