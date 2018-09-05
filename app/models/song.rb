class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  validates_presence_of :title,
                        :length,
                        :bpm,
                        :genre,
                        :link
end
