require 'rails_helper'

describe 'R-user/admin visits playlist show page' do
  before(:each) do
    @artist_1 = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist_1.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, genre: 'Salsa', link: "http://youtube.com")
    @song_3 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, genre: 'Salsa', link: "http://youtube.com")
    @playlist_1 = Playlist.create(title: 'Bachata Nights', songs: [@song_1])
    @playlist_2 = Playlist.create(title: 'Salsa Nights', songs: [@song_2, @song_3])
  end
  describe 'R-user/admin sees playlist and songs for the playlist' do
    describe 'R-user/admin clicks on edit button for playlist' do
      it 'should link to edit page' do

        visit playlist_path(@playlist_1)

        expect(page).to have_content(@artist_1.name)

        within("#playlist-#{@playlist_1.id}") do
          click_link 'edit'
        end

        expect(current_path).to eq(edit_playlist_path(@playlist_1))
      end
    end
    describe 'R-user/admin submits edit form' do
      it 'should update playlist and link back to show' do

        visit edit_playlist_path(@playlist_1)

        fill_in 'playlist[title]', with: 'Cumbia Nights'

        click_on 'Update Playlist'

        expect(current_path).to eq(playlist_path(@playlist_1))
        expect(page).to have_content('Cumbia Nights')
        expect(page).to_not have_content('Bachata Nights')
      end
    end
  end
end
