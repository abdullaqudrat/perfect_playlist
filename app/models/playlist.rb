class Playlist < ApplicationRecord
  validates_presence_of :title
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
end
