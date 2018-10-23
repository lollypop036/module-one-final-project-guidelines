class CreateArtistsTable < ActiveRecord::Migration[5.0]

    def change 
        create_table do |t|
            t.string :name
            t.string :location
            t.integer :style
    end

end