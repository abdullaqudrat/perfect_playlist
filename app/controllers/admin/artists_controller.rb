class Admin::ArtistsController < Admin::BaseController

  def index
    @artists = Artist.all
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.songs.destroy_all
    artist.destroy
    redirect_to admin_artists_path
  end

end
