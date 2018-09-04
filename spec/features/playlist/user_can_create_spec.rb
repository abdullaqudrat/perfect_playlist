require 'rails_helper'

describe 'user visits playlist index page' do
  describe 'user clicks on create a new playlist' do
    it 'should link to a create playlist form' do

      visit playlists_path

      click_on "Create a New Playlist"

      expect(current_path).to eq(new_playlist_path)
    end
  end
end
describe 'user is on new playlist page' do
  describe 'user can submit new playlist' do
    it 'should see new playlist at show page' do

      visit new_playlist_path

      fill_in "playlist[title]", with: 'Merengue Nights'

      click_on 'Create Playlist'

      expect(current_path).to eq(playlist_path(Playlist.last))
      expect(page).to have_content("Merengue Nights")
    end
  end
end
