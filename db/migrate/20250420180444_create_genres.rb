class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
