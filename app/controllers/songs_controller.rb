class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end

  def show
    # :set_song
  end

  def new
  end

  def edit
    # :set_song
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end
end
