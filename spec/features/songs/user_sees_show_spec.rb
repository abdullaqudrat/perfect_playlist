require 'rails_helper'

describe 'user visits song show page' do
  it 'user sees song and artist' do
    artist = Artist.create(name: 'Romeo Santos')
    song = artist.songs.create(title: 'Odio', length: 255, bpm: 110, genre: 'Sensual Bachata', link: "http://youtube.com")
    playlist_1 = Playlist.create(title: 'Bachata Nights', songs: [song])
    playlist_2 = Playlist.create(title: 'Bachata Best Hits', songs: [song])

    visit song_path(song)

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.artist.name)
    expect(page).to have_content(song.length)
    expect(page).to have_content(song.bpm)
    expect(page).to have_content(song.genre)
    expect(page).to have_content(song.link)
    expect(page).to have_content(playlist_1.title)
    expect(page).to have_content(playlist_2.title)
  end
end
