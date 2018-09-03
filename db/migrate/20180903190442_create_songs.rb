class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.integer :bpm
      t.string :dance
      t.string :link
      t.references :artist, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
