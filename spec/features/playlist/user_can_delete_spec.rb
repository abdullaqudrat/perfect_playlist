require 'rails_helper'

describe 'admin visits playlist show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
    @song_2 = @artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
  end
  describe 'admin sees artist and songs for the playlist' do
    describe 'admin clicks on delete button for playlist' do
      it 'should delete playlist and go back to playlist index page' do

        visit playlist_path(@playlist)

        expect(page).to have_content(@playlist.title)
        expect(page).to have_content(@artist.name)
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)

        within("#playlist-#{@playlist.id}") do
          click_link 'delete'
        end

        expect(current_path).to eq(playlists_path)

        expect(page).to_not have_content(@playlist.title)
      end
    end
  end
end
