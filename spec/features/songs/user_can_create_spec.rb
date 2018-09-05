require 'rails_helper'

describe 'creating song' do
  before(:each) do
    @artist = Artist.create(name: 'Romeo Santos')
    @artist_2 = Artist.create(name: 'Prince Royce')
    @playlist = Playlist.create(title: 'Bachata Nights')
    @playlist_2= Playlist.create(title: 'Salsa Nights')
  end
  describe 'user visits song index page' do
    describe 'user clicks on create a new song' do
      it 'should link to a create song form' do

        visit songs_path

        click_on "Create a New Song"

        expect(current_path).to eq(new_song_path)
      end
    end
  end
  describe 'user is on new song page' do
    describe 'user can submit new song' do
      it 'should see new song at show page' do

        visit new_song_path

        fill_in 'song[title]', with: 'Odio'
        select 'Prince Royce', from: "Artist"
        fill_in 'song[length]', with: '256'
        fill_in 'song[bpm]', with: '80'
        fill_in 'song[genre]', with: 'slow bachata'
        fill_in 'song[link]', with: 'www.bachata.com'

        click_on 'Create Song'

        expect(current_path).to eq(song_path(Song.last))
        expect(page).to have_content("Odio")
        expect(page).to have_content('Prince Royce')
        expect(page).to have_content("Length: 256")
        expect(page).to have_content("BPM: 80")
        expect(page).to have_content("slow bachata")
        expect(page).to have_content('www.bachata.com')
      end
    end
  end
end
