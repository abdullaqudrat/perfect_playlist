require 'rails_helper'

describe 'admin visits songs show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
  end
  describe 'admin sees delete button' do
    describe 'admin clicks on delete button for artist' do
      it 'should delete artist and go back to artist index page' do

        visit song_path(@song)

        expect(page).to have_content(@song.title)
        expect(page).to have_content(@song.artist.name)

        click_on 'delete'

        expect(current_path).to eq(songs_path)

        expect(page).to_not have_content(@song.title)
      end
    end
  end
end
