class CreateMusicGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :music_genres do |t|
      t.string :nome

      t.timestamps
    end
  end
end
