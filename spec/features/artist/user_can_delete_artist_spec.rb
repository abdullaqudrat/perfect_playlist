require 'rails_helper'

describe 'admin visits artist show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
    @song_2 = @artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
  end
  describe 'admin sees artist and songs for the artist' do
    describe 'admin clicks on delete button for artist' do
      it 'should delete artist and go back to artist index page' do

        visit artist_path(@artist)

        expect(page).to have_content(@artist.name)
        expect(page).to have_content(@song_1.title)
        expect(page).to have_content(@song_2.title)

        click_on 'delete'

        expect(current_path).to eq(artists_path)

        expect(page).to_not have_content(@artist.name)
      end
    end
  end
end
