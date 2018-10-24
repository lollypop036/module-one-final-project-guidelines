class  AllowArtistsToCreateExhibitions < ActiveRecord::Migration[5.0]


    def change
        add_column :exhibitions, :artist_id, :integer
    end
    
    end