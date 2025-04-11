class CreateServiceTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :service_types do |t|
      t.string :nome
      t.decimal :preco
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
