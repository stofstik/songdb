class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  def index
    if params[:order_by] == 'created_at'
      @artists = Artist.all.order(:created_at)
    elsif params[:order_by] == 'name'
      @artists = Artist.all.order(:name)
    else
      @artists = Artist.all
    end
  end

  def show
    @songs = @artist.songs
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

end
