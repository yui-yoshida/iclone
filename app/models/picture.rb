class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { maximum: 200 }
  validates :image, presence: true
end
