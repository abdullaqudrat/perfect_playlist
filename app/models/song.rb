class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :playlist
  validates_presence_of :title,
                        :length,
                        :bpm,
                        :dance,
                        :link
end
