class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:15 }
  validates :email, presence:true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :topics
 has_many :favorites, dependent: :destroy
 has_many :favorite_topics, through: :favorites, source: 'topic'

  has_secure_password
  validates :password, presence: true, length: { minimum:8 },
 format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_nil:true

  has_many :topics,dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

 has_many :following, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :image, ImageUploader

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
