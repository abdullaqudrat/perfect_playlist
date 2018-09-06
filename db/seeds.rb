# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.destroy_all
Song.destroy_all

ARTISTS = ["Prince Royce", "Romeo Santos", "Toby Love", "Hector Acosta", "Marc Anthony", "Xtreme", "Celia Cruz", "FClan"]
SONGS = ["Valio La Pena", "Odio", "Eres Mia", "Darte Un Beso", "Imitadora", "Promise", "Deja Vu", "Te Extrano"]
GENRES = ["Salsa", "Bachata", "Merengue", "Cumbia"]
LENGTHS = (150..400).to_a
BPMS = (66..150).to_a
PLAYLISTS = ["Best Salsa", "Salsa Nights", "Best Bachata", "Bachata Nights", "Mix 70/30"]
SONGO = []
ARTISTS.each do |name|
  artist = Artist.create!(name: name)
  puts "Created #{artist.name}"
  10.times do |num|
    SONGO << artist.songs.create!(title: SONGS.sample, length: LENGTHS.sample, bpm: BPMS.sample, genre: GENRES.sample, link: "www.youtube.com")
    puts "  Created #{artist.songs[num].title}"
  end
end
PLAYLISTS.each do |title|
  playlist = Playlist.create!(title: title, songs: SONGO.sample(3))
  puts "Created #{playlist.title}"
end
