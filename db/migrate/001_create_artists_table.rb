class CreateArtistsTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :artists do |t|
            t.string :name
            t.string :location
            t.integer :style_id
    end

end