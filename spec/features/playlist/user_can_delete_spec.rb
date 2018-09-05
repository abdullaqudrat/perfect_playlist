require 'rails_helper'

describe 'admin visits playlist show page' do
  before(:each) do
    @artist_1 = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist_1.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, genre: 'Salsa', link: "http://youtube.com")
    @song_3 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, genre: 'Salsa', link: "http://youtube.com")
    @playlist_1 = Playlist.create(title: 'Bachata Nights', songs: [@song_1])
    @playlist_2 = Playlist.create(title: 'Salsa Nights', songs: [@song_2, @song_3])
  end
  describe 'admin sees artist and songs for the playlist' do
    describe 'admin clicks on delete button for playlist' do
      it 'should delete playlist and go back to playlist index page' do

        visit playlist_path(@playlist_2)

        expect(page).to have_content(@playlist_2.title)
        expect(page).to have_content(@artist_2.name)
        expect(page).to have_content(@song_2.title)
        expect(page).to have_content(@song_3.title)

        within("#playlist-#{@playlist_2.id}") do
          click_link 'delete'
        end

        expect(current_path).to eq(playlists_path)

        expect(page).to_not have_content(@playlist_2.title)
      end
    end
  end
end
