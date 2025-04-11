class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :localizacao, :string
    add_column :users, :biografia, :text
    add_column :users, :status, :boolean
    add_column :users, :avaliacao, :float
    add_column :users, :telefone, :string
  end
end
