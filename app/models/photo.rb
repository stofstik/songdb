class Photo < ApplicationRecord
  belongs_to :artist

  validates :artist_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
