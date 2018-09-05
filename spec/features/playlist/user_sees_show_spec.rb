require 'rails_helper'

describe 'user visits playlist show page' do
  before(:each) do
    @artist_1 = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist_1.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, genre: 'Salsa', link: "http://youtube.com")
    @song_3 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, genre: 'Salsa', link: "http://youtube.com")
    @playlist_1 = Playlist.create(title: 'Bachata Nights', songs: [@song_1])
    @playlist_2 = Playlist.create(title: 'Salsa Nights', songs: [@song_2, @song_3])
  end
  it 'should show playlist with song attributes' do

    visit playlist_path(@playlist_2)

    expect(page).to have_content(@playlist_2.title)
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content(@song_2.link)
    expect(page).to have_content(@song_2.artist.name)
    expect(page).to have_content(@song_3.title)
    expect(page).to have_content(@song_3.length)
  end
  describe 'user clicks on song title' do
    it 'should take user to song show page' do

      visit playlist_path(@playlist_2)

      click_on @song_2.title

      expect(current_path).to eq(song_path(@song_2))
    end
  end
  describe 'user clicks on artist name' do
    it 'should take user to artist show page' do

      visit playlist_path(@playlist_2)

      within("#song-#{@song_2.id}") do
        click_on @song_2.artist.name
      end

      expect(current_path).to eq(artist_path(@artist_2))
    end
  end

end
