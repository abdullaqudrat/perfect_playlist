require 'rails_helper'

describe 'user visits artist index page' do
  describe 'user clicks on create a new artist' do
    it 'should link to a create artist form' do

      visit artists_path

      click_on "Create a New Artist"

      expect(current_path).to eq(new_artist_path)
    end
  end
end
describe 'user is on new artist page' do
  describe 'user can submit new artist' do
    it 'should see new artist at show page' do

      visit new_artist_path

      fill_in "artist[name]", with: 'Tronky'

      click_on 'Create Artist'

      expect(current_path).to eq(artist_path(Artist.last))
      expect(page).to have_content("Tronky")
    end
  end
end
