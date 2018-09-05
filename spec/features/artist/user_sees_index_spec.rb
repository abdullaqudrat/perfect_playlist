require 'rails_helper'

describe 'R-user/admin visits artist index page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Prince Royce')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @song = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Eres Mia', length: 333, bpm: 99, genre: 'Pop Bachata', link: "http://youtube.com")
  end
  describe 'R-user/admin sees list of artists' do
    describe 'R-user/admin clicks on artist name' do
      it 'should link to artist show page' do

        visit artists_path

        expect(page).to have_content("All Artists")
        expect(page).to have_content(@artist.name)
        expect(page).to have_content(@artist_2.name)

        within("#artist-#{@artist.id}") do
          click_on "#{@artist.name}"
        end

        expect(current_path).to eq(artist_path(@artist))
      end
    end
  end
end
