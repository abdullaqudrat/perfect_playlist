require 'rails_helper'

describe 'R-user/admin visits artist show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
    @song_2 = @artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
  end
  describe 'R-user/admin sees artist and songs for the artist' do
    describe 'R-user/admin clicks on edit button for artist' do
      it 'should link to edit page' do

        visit artist_path(@artist)

        expect(page).to have_content(@artist.name)
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)

        click_on 'edit'

        expect(current_path).to eq(edit_artist_path(@artist))
      end
    end
    describe 'R-user/admin submits edit form' do
      it 'should update artist and link back to show' do

        visit edit_artist_path(@artist)

        fill_in 'artist[name]', with: 'Prince Royce'

        click_on 'Update Artist'

        expect(current_path).to eq(artist_path(@artist))
        expect(page).to have_content('Prince Royce')
        expect(page).to_not have_content('Romeo Santos')
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)
      end
    end
  end
end
