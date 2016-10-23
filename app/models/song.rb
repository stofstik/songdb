class Song < ApplicationRecord
  belongs_to :artist

  validates :artist_id, presence: true
  validates :name, presence: true, length: { maximum: 128 }
end
