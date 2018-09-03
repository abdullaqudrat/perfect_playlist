class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :destroy, :update]

  def index
    @artists = Artist.all
  end

  def show
    #set_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to artist_path(artist)
  end

  def edit
    #set_artist
  end

  def update
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist.songs.destroy_all
    @artist.destroy
    redirect_to artists_path
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
