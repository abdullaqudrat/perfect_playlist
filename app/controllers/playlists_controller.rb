class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  def index
    @playlists = Playlist.all
  end

  def show
    # set_playlist
  end

  def new
  end

  def edit
    # set_playlist
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end
end
