class AddIdColumnsForArtistAndCurator < ActiveRecord::Migration[5.0]


    def change
        add_column :bookings, :curator_id, :integer
        add_column :bookings, :artist_id, :integer
    end





end