class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
    # :set_song
  end

  def new
    @song = Song.new
    @artists = Artist.all
    @playlists = Playlist.all
  end

  def create
    song = Song.new(song_params)
    song.save
    redirect_to song_path(song)
  end

  def edit
    # :set_song
    @artists = Artist.all
    @playlists = Playlist.all
  end

  def update
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :length, :bpm, :dance, :link, :artist_id, :playlist_id)
    end
end
