require 'rails_helper'

describe 'user visits songs index page' do
  before(:each) do
    @playlist_1 = Playlist.create(title: 'Bachata Nights')
    @playlist_2 = Playlist.create(title: 'Salsa Nights')
    @artist = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, genre: 'Salsa', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, genre: 'Salsa', link: "http://youtube.com")
  end
  it 'should see all songs' do

    visit songs_path

    expect(page).to have_content("All Songs")
    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@song_2.title)
  end
  describe 'user clicks on song name' do
    it 'should take user to show page of song clicked' do

      visit songs_path

      within("#song-#{@song_1.id}") do
        click_on "#{@song_1.title}"
      end

      expect(current_path).to eq(song_path(@song_1))
    end
  end
end
