require "rails_helper"

describe "User visits artist index page" do
  context "as admin" do
    it "allows admin to delete artist from index" do
      admin = User.create(username: "abdulla", password: "kapow", role: 1)
      artist = Artist.create(name: 'Romeo Santos')
      artist_2 = Artist.create(name: 'Prince Royce')
      playlist = Playlist.create(title: 'Bachata Nights')
      song = artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
      song_2 = artist_2.songs.create(title: 'Eres Mia', length: 333, bpm: 99, genre: 'Pop Bachata', link: "http://youtube.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artists_path

      expect(page).to have_content("Admin: All Artists")
      expect(page).to have_content(artist.name)
      expect(page).to have_content(artist_2.name)

      within("#artist-#{artist.id}") do
        click_on 'delete'
      end

      expect(page).to have_content("Admin: All Artists")
      expect(page).to_not have_content(artist.name)
      expect(page).to have_content(artist_2.name)

      visit artists_path

      expect(page).to have_content("All Artists")
      expect(page).to_not have_content(artist.name)
      expect(page).to have_content(artist_2.name)
    end
  end
  context "as registered user" do
    it 'does not allow registered user to delete artist from index' do
      user = User.create(username: "musiclover", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_artists_path

      expect(page).to_not have_content("Admin: All Artists")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
