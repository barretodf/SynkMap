class CreateAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.date :data
      t.boolean :disponivel

      t.timestamps
    end
  end
end
