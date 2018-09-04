require 'rails_helper'

describe 'R-user/admin visits song show page' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Prince Royce')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @playlist_2= Playlist.create(title: 'Salsa Nights')
    @song = @artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: @playlist.id)
  end
  describe 'R-user/admin sees song' do
    describe 'R-user/admin clicks on edit button for song' do
      it 'should link to edit page' do

        visit song_path(@song)

        expect(page).to have_content(@song.title)
        expect(page).to have_content(@song.artist.name)
        expect(page).to have_content(@song.length)
        expect(page).to have_content(@song.bpm)
        expect(page).to have_content(@song.dance)
        expect(page).to have_content(@song.link)

        click_on 'edit'

        expect(current_path).to eq(edit_song_path(@song))
      end
    end
    describe 'R-user/admin submits edit form' do
      it 'should update song and link back to show' do

        visit edit_song_path(@song)

        fill_in 'song[title]', with: 'Odio'
        select 'Prince Royce', from: "Artist"
        fill_in 'song[length]', with: '256'
        fill_in 'song[bpm]', with: '80'
        fill_in 'song[dance]', with: 'slow bachata'
        fill_in 'song[link]', with: 'www.bachata.com'
        select 'Salsa Nights', from: "Playlist"

        click_on 'Update Song'

        expect(current_path).to eq(song_path(@song))
        expect(page).to have_content('Prince Royce')
        expect(page).to_not have_content('Romeo Santos')
        expect(page).to have_content('Odio')
        expect(page).to_not have_content('Eres Mia')
        expect(page).to have_content("Length: 256")
      end
    end
  end
end
