require 'rails_helper'

describe 'user visits artist show page' do
  it 'user sees artist and songs for the artist' do
    artist = Artist.create(name: 'Romeo Santos')
    playlist = Playlist.create(title: 'Bachata Nights')
    song_1 = artist.songs.create(title: 'Odio', length: 255, bpm: 110, dance: 'Sensual Bachata', link: "http://youtube.com", playlist_id: playlist.id)
    song_2 = artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, dance: 'Pop Bachata', link: "http://youtube.com", playlist_id: playlist.id)

    visit artist_path(artist)

    expect(page).to have_content(artist.name)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end
end
