class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  def index
    @playlists = Playlist.all.reverse
  end

  def show
    # set_playlist
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      flash[:notice] = 'Created!'
      redirect_to playlist_path(@playlist)
    else
      flash[:notice] = 'Enter Title!'
      render :new
    end
  end

  def edit
    # set_playlist
  end

  def update
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  def destroy
    PlaylistSong.where(playlist_id: @playlist.id).destroy_all
    @playlist.destroy
    redirect_to playlists_path
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title)
    end
end
