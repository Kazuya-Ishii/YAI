class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :topic

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
