describe 'user is on new playlist page' do
  before(:each) do
    @artist_1 = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Marc Anthony')
    @song_1 = @artist_1.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    @song_2 = @artist_2.songs.create(title: 'Felices los cuatro', length: 333, bpm: 140, genre: 'Salsa', link: "http://youtube.com")
    @song_3 = @artist_2.songs.create(title: 'Valio la pena', length: 232, bpm: 120, genre: 'Salsa', link: "http://youtube.com")
    @playlist = Playlist.create(title: 'Bachata Nights')
  end
  describe 'user can submit new song to playlist' do
    it 'should see song on playlist show page' do

      visit new_playlist_song_path(@playlist)

      select 'Odio', from: "Song"

      click_on 'Add Song'

      expect(current_path).to eq(playlist_song_path(@playlist))
      expect(page).to have_content("Odio")
    end
  end
end
