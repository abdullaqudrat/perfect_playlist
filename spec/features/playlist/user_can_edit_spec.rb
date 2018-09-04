require 'rails_helper'

describe 'R-user/admin visits playlist show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
    @song_2 = @artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
  end
  describe 'R-user/admin sees playlist and songs for the playlist' do
    describe 'R-user/admin clicks on edit button for playlist' do
      it 'should link to edit page' do

        visit playlist_path(@playlist)

        expect(page).to have_content(@artist.name)
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)

        within("#playlist-#{@playlist.id}") do
          click_link 'edit'
        end

        expect(current_path).to eq(edit_playlist_path(@playlist))
      end
    end
    describe 'R-user/admin submits edit form' do
      it 'should update playlist and link back to show' do

        visit edit_playlist_path(@playlist)

        fill_in 'playlist[title]', with: 'Cumbia Nights'

        click_on 'Update Playlist'

        expect(current_path).to eq(playlist_path(@playlist))
        expect(page).to have_content('Cumbia Nights')
        expect(page).to_not have_content('Bachata Nights')
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)
      end
    end
  end
end
