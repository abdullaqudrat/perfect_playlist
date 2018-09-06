class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all.order(:title)
  end

  def show
    # :set_song
  end

  def new
    @song = Song.new
    @artists = Artist.all
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      flash[:notice] = 'Created!'
      redirect_to song_path(@song)
    else
      flash[:notice] = 'Enter All Fields!'
      render :new
    end
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

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :length, :bpm, :genre, :link, :artist_id)
    end
end
