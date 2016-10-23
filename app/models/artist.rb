class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_one :photo, dependent: :destroy

  validates :name, presence: true, length: { maximum: 128 }

  def photo_url
    photo.image
  end

  def self.ordered_by_name
    Artist.all.order(:name)
  end

  def self.ordered_by_created
    Artist.all.order(:created_at)
  end

end
