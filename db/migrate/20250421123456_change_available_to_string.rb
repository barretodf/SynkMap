class ChangeAvailableToString < ActiveRecord::Migration[7.1]
    def change
      change_column :users, :available, :string, default: "Indisponível"
    end
  end