require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe "validations" do

    it "is invalid without a name" do
      artist = Artist.new(name: '')
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid with a name longer than 128 chars" do
      artist = Artist.new(name: Faker::Lorem.sentence(60, false ,0))
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

  end

  describe "methods" do

    photo  = Photo.new(image: "BlaImage")
    artist = Artist.new(name: 'Bla', photo: photo)

    it "should respond to photo_url" do
      expect(artist.photo_url).to respond_to()
    end
    it "should respond to ordered_by_name" do
      expect(Artist.ordered_by_name).to respond_to()
    end
    it "should respond to ordered_by_created" do
      expect(Artist.ordered_by_created).to respond_to()
    end

  end

end
