class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.text :bio
      t.float :rating
      t.boolean :available

      t.timestamps
    end
  end
end
