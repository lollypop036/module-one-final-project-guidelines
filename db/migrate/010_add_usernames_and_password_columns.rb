class AddUsernamesAndPasswordColumns < ActiveRecord::Migration[5.0]

    def change
        add_column :artists, :username, :string
        add_column :artists, :password, :string
        add_column :curators, :username, :string
        add_column :curators, :password, :string
        add_column :users, :password, :string
    end

end