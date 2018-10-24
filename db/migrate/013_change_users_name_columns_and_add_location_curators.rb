class ChangeUsersNameColumnsAndAddLocationCurators < ActiveRecord::Migration[5.0]

    def change
        remove_column :users, :last_name
        rename_column :users, :first_name, :name
        add_column :curators, :location, :string

    end
end