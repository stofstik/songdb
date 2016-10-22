class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to Artist.find(song_params[:artist_id]) }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { redirect_to artist_path }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      redirect_to @song.artist
      format.json { head :no_content }
    end
  end

  private
    def song_params
      params.require(:song).permit(:name, :artist_id)
    end

end
