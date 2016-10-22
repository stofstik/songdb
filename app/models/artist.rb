class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_one :photo, dependent: :destroy

  def self.ordered_by_name
    Artist.all.order(:name)
  end

  def self.ordered_by_created
    Artist.all.order(:created_at)
  end

end
