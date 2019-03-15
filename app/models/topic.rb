class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true, if: -> { video.blank? }
  validates :video, presence: true, if: -> { image.blank? }
  validates :category, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

end