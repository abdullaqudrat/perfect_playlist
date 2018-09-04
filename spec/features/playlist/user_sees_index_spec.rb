require 'rails_helper'

describe 'user visits playlist index page' do
  before(:each) do
    @playlist_1 = Playlist.create(title: 'Bachata Nights')
    @playlist_2 = Playlist.create(title: 'Salsa Nights')
    @artist = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: @playlist_1.id)
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, dance: 'Salsa', link: "http://youtube.com", playlist_id: @playlist_2.id)
    @song_2 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, dance: 'Salsa', link: "http://youtube.com", playlist_id: @playlist_2.id)
  end
  it 'should see all playlists' do

    visit playlists_path

    expect(page).to have_content("All Playlists")
    expect(page).to have_content(@playlist_1.title)
    expect(page).to have_content(@playlist_2.title)
  end
  describe 'user clicks on playlist name' do
    it 'should take user to show page of playlist clicked' do

      visit playlists_path

      within("#playlist-#{@playlist_1.id}") do
        click_on "#{@playlist_1.title}"
      end

      expect(current_path).to eq(playlist_path(@playlist_1))
    end
  end
end
