class RenameColumns < ActiveRecord::Migration[5.0]

    def reversible
        change_column :exhibitions, :date, :string
        change_column :exhibitions, :time, :string
    end
end
