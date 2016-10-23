require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do

    it "is invalid without a name" do
      song = Song.new(name: '')
      song.valid?
      expect(song.errors).to have_key(:name)
    end

    it "is invalid without an artist" do
      song = Song.new(name: 'Bla')
      song.valid?
      expect(song.errors).not_to have_key(:name)
      expect(song.errors).to have_key(:artist_id)
    end

    it "is invalid with a name longer than 128 chars" do
      song = Song.new(name: Faker::Lorem.sentence(60, false ,0))
      song.valid?
      expect(song.errors).to have_key(:name)
      expect(song.errors).to have_key(:artist_id)
    end

  end
end
