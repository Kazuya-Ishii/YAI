class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true, if: -> { video.blank? }
  validates :video, presence: true, if: -> { image.blank? }
  validates :category, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'

  has_many :comments

end
