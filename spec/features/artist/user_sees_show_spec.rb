require 'rails_helper'

describe 'user visits artist show page' do
  it 'user sees artist and songs for the artist' do
    artist = Artist.create(name: 'Romeo Santos')
    playlist = Playlist.create(title: 'Bachata Nights')
    song_1 = artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    song_2 = artist.songs.create(title: 'Eres Mia', length: 333, bpm: 99, genre: 'Pop Bachata', link: "http://youtube.com")

    visit artist_path(artist)

    expect(page).to have_content(artist.name)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
  end
end
