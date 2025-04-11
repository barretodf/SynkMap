class CreateUserGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :user_genres do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music_genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
