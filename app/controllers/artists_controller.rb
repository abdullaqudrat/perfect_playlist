class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :destroy, :update]

  def index
    @artists = Artist.all.order(:name)
  end

  def show
    #set_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      flash[:notice] = 'Created!'
      redirect_to artist_path(@artist)
    else
      flash[:notice] = 'Enter name!'
      render :new
    end
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
